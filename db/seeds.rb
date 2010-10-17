# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).


# Platforms lookup table (gem scanner code to human name)
PLATFORMS = {
  :jruby => 'JRuby',
  :ironruby => 'IronRuby',
  :windows => 'Windows',
  :rubinius => 'Rubinius',
  :ree => 'REE',
  :macruby => 'MacRuby',
  :maglev => 'MagLev',
  :mri_186 => 'MRI 1.8.6',
  :mri_187 => 'MRI 1.8.7',
  :mri_19 => 'MRI 1.9',
  :unknown => 'Unknown'
}

PLATFORMS.each do |code, name|
  Platform.create(:code => code, :name => name) unless Platform.find_by_code(code)
end
