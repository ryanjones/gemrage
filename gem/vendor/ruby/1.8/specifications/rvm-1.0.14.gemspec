# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rvm}
  s.version = "1.0.14"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Wayne E. Seguin"]
  s.date = %q{2010-10-04}
  s.default_executable = %q{rvm-install}
  s.description = %q{Manages Ruby interpreter environments and switching between them.}
  s.email = %q{wayneeseguin@gmail.com}
  s.executables = ["rvm-install"]
  s.extra_rdoc_files = ["README"]
  s.files = ["LICENCE", "README", "binscripts/rvm", "binscripts/rvm-auto-ruby", "binscripts/rvm-prompt", "binscripts/rvm-shell", "binscripts/rvm-update-head", "binscripts/rvm-update-latest", "binscripts/rvmsudo", "config/db", "config/known", "config/md5", "contrib/gemset_snapshot", "contrib/install-system-wide", "contrib/r", "examples/rvmrc", "gemsets/default.gems", "gemsets/global.gems", "help/alias", "help/benchmark", "help/cleanup", "help/debug", "help/disk-usage", "help/docs", "help/exec", "help/fetch", "help/gem", "help/gemdir", "help/gemset", "help/implode", "help/info", "help/install", "help/list", "help/migrate", "help/monitor", "help/notes", "help/package", "help/rake", "help/remove", "help/repair", "help/reset", "help/ruby", "help/rubygems", "help/rvmrc", "help/snapshot", "help/specs", "help/srcdir", "help/tests", "help/tools", "help/uninstall", "help/update", "help/upgrade", "help/use", "help/wrapper", "install", "lib/VERSION.yml", "lib/rvm.rb", "lib/rvm/capistrano.rb", "lib/rvm/environment.rb", "lib/rvm/environment/alias.rb", "lib/rvm/environment/cleanup.rb", "lib/rvm/environment/configuration.rb", "lib/rvm/environment/env.rb", "lib/rvm/environment/gemset.rb", "lib/rvm/environment/info.rb", "lib/rvm/environment/list.rb", "lib/rvm/environment/rubies.rb", "lib/rvm/environment/sets.rb", "lib/rvm/environment/tools.rb", "lib/rvm/environment/utility.rb", "lib/rvm/environment/wrapper.rb", "lib/rvm/errors.rb", "lib/rvm/install_command_dumper.rb", "lib/rvm/shell.rb", "lib/rvm/shell/abstract_wrapper.rb", "lib/rvm/shell/calculate_rvm_path.sh", "lib/rvm/shell/result.rb", "lib/rvm/shell/shell_wrapper.sh", "lib/rvm/shell/single_shot_wrapper.rb", "lib/rvm/shell/utility.rb", "lib/rvm/version.rb", "man/man1/rvm.1", "man/man1/rvm.1.gz", "rvm.gemspec", "scripts/alias", "scripts/aliases", "scripts/array", "scripts/base", "scripts/cd", "scripts/cleanup", "scripts/cli", "scripts/color", "scripts/completion", "scripts/db", "scripts/default", "scripts/disk-usage", "scripts/docs", "scripts/env", "scripts/environment-convertor", "scripts/fetch", "scripts/gemsets", "scripts/hash", "scripts/help", "scripts/hook", "scripts/info", "scripts/initialize", "scripts/install", "scripts/irbrc", "scripts/irbrc.rb", "scripts/list", "scripts/log", "scripts/maglev", "scripts/manage", "scripts/match", "scripts/md5", "scripts/migrate", "scripts/monitor", "scripts/notes", "scripts/override_gem", "scripts/package", "scripts/patches", "scripts/patchsets", "scripts/repair", "scripts/rubygems", "scripts/rvm", "scripts/rvm-install", "scripts/selector", "scripts/set", "scripts/snapshot", "scripts/tools", "scripts/update", "scripts/upgrade", "scripts/utility", "scripts/version", "scripts/wrapper", "bin/rvm-install"]
  s.homepage = %q{http://github.com/wayneeseguin/rvm}
  s.post_install_message = %q{********************************************************************************

  In order to setup rvm for your user's environment you must now run rvm-install.
  rvm-install will be found in your current gems bin directory corresponding to where the gem was installed.

  rvm-install will install the scripts to your user account and append itself to your profiles in order to
  inject the proper rvm functions into your shell so that you can manage multiple rubies.

********************************************************************************
}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{rvm}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Ruby Version Manager (rvm)}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
