module RubygemsHelper
  def gem_stats(rg)
    {
      'Downloads' => rg.downloads,
      'Installs' => Rails.cache.fetch([rg.cache_key, 'install-count'].join(':')) { rg.installed_gems.count },
      'Installs (latest version)' => Rails.cache.fetch([rg.cache_key, 'latest-install-count'].join(':')) { rg.installed_gems.where("version_list LIKE ?", "%#{rg.latest_version}%").count }
    }
  end
end