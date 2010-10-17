rails_root = "/srv/gemrage/current"

2.times do |num|
  God.watch do |w|
    w.name = "dj-#{num}"
    w.group = 'dj'

    w.interval = 30.seconds
    w.start_grace = 10.seconds
    w.stop_timeout = 10.seconds
    w.pid_file = File.join(rails_root, 'tmp', 'pids', "delayed_job.#{num}.pid")
    w.start = "/bin/su -c 'RAILS_ENV=#{ENV['RAILS_ENV']} /usr/bin/ruby #{rails_root}/script/delayed_job start -i #{num}' - rails"
    w.stop = "/bin/su -c 'RAILS_ENV=#{ENV['RAILS_ENV']} su/usr/bin/ruby #{rails_root}/script/delayed_job stop -i #{num}' - rails"

    # retart if memory gets too high
    w.transition(:up, :restart) do |on|
      on.condition(:memory_usage) do |c|
        c.above = 150.megabytes
        c.times = 2
      end
    end

    # determine the state on startup
    w.transition(:init, { true => :up, false => :start }) do |on|
      on.condition(:process_running) do |c|
        c.running = true
      end
    end

    # determine when process has finished starting
    w.transition([:start, :restart], :up) do |on|
      on.condition(:process_running) do |c|
        c.running = true
        c.interval = 5.seconds
      end

      # failsafe
      on.condition(:tries) do |c|
        c.times = 5
        c.transition = :start
        c.interval = 5.seconds
      end
    end

    # start if process is not running
    w.transition(:up, :start) do |on|
      on.condition(:process_running) do |c|
        c.running = false
      end
    end
  end
end