module PagesHelper
  def basic_stats
    [
      [
        'Number of gems tracked',
        'Number of gems installed',
        'Number of gems in projects'
      ],
      [
        Rails.cache.fetch('Rubygem-count', :expires_in => 30.minutes) { Rubygem.count },
        Rails.cache.fetch('InstalledGem-count', :expires_in => 30.minutes) { InstalledGem.count },
        Rails.cache.fetch('ProjectGem-count', :expires_in => 30.minutes) { ProjectGem.count },
      ]
    ]
  end

  def cached_platform_ig_count(platform)
    Rails.cache.fetch([platform.cache_key, 'installed_gem-count'].join(':'), :expires_in => 30.minutes) { platform.installed_gems.count }
  end

  def top_25_installed_gems
    Rails.cache.fetch('installed-gem-stats', :expires_in => 30.minutes) { Rubygem.joins(:installed_gems).group('rubygems.id').select('rubygems.name, rubygems.info, rubygems.latest_version, rubygems.id, COUNT(installed_gems.id) AS gem_count').order('gem_count DESC').limit(25).all }
  end

  def top_25_project_gems
    Rails.cache.fetch('project-gem-stats', :expires_in => 30.minutes) { Rubygem.joins(:project_gems).group('rubygems.id').select('rubygems.name, rubygems.info, rubygems.latest_version, rubygems.id, COUNT(project_gems.id) AS gem_count').order('gem_count DESC').limit(25).all }
  end
end
