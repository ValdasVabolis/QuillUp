require 'ostruct'
require 'yaml'

raw_config = File.read("#{Rails.root}/config/config.yml")
erb_result = ERB.new(raw_config).result
config = YAML.load(erb_result)[Rails.env]
APP_CONFIG = OpenStruct.new(config)