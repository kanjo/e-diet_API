require 'inifile'

export AWS_ACCESS_KEY_ID=`ruby -rinifile -e "puts IniFile.load(File.join(File.expand_path('.'), '.aws', 'config'))['default']['aws_access_key_id']"`
export AWS_SECRET_ACCESS_KEY=`ruby -rinifile -e "puts IniFile.load(File.join(File.expand_path('.'), '.aws', 'config'))['default']['aws_secret_access_key']"`
export AWS_DEFAULT_REGION=`ruby -rinifile -e "puts IniFile.load(File.join(File.expand_path('.'), '.aws', 'config'))['default']['region']"`