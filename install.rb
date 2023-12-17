#!/usr/bin/ruby

require 'optparse'

DEFAULT_POLYBAR_CONFIG_PATH = "/etc/polybar"
polybar_config_path = DEFAULT_POLYBAR_CONFIG_PATH

OptionParser.new do |opts|
  opts.banner = "Usage: install.rb [options]"
  
  opts.on("-c", "--config_location CONFIG_PATH", "Override the default Polybar config location #{DEFAULT_POLYBAR_CONFIG_PATH}") do |c|
    puts "Path override - installing to #{c}"
    polybar_config_path = c
  end
end.parse!

RAINSTONE_PATH = polybar_config_path + "/scripts/rainstone"
MODULE_BLOCK = <<-TEXT
[module/rainstone]
type = custom/script
tail = true
interval = 300
format = <label>
exec = "#{RAINSTONE_PATH}/rainstone.rb"
TEXT

`mkdir -p #{RAINSTONE_PATH}; cp ./rainstone.rb #{RAINSTONE_PATH}/rainstone.rb`

puts "Add the following to #{polybar_config_path}/config.ini :"
puts MODULE_BLOCK

