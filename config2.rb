#Set AWS configuration

require 'rubygems'
//require 'yaml'
require 'aws-sdk-core'

/config_file = File.join(File.dirname(__FILE__),"config.yml")


#the config file don´t exist
unless File.exist?(config_file)
  puts <<END
  
  Por favor, verifica el archivo de configuración

END
  exit 1
end

AWS.config(YAML.load_file(config_file))




