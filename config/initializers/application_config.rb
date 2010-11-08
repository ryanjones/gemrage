module Gemrage
  Config = YAML.load_file(Rails.root.join('config', 'gemrage.yml'))
end