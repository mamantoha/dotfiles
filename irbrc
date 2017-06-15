require 'irb/completion' rescue nil
require 'irb/ext/save-history'
ARGV.concat [ "--readline", "--prompt-mode", "simple" ]
IRB.conf[:SAVE_HISTORY] = 100
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"

# Calculate the ruby string.
ruby_string =
  (
    ENV['GEM_HOME'] &&
    ( path = ( File.realpath(ENV['GEM_HOME'].to_s) rescue nil ) ) &&
    ( path = $1 if path =~ /(.+)\/$/ ; true ) &&
    String(String(path).split(/\//).last).split(/@/).first
  ) ||
  ("#{RUBY_VERSION}-p#{RUBY_PATCHLEVEL}" rescue nil) ||
  (RUBY_DESCRIPTION.split(" ")[1].sub('p', '-p') rescue nil ) ||
  (`ruby -v` || '').split(" ")[1].sub('p', '-p')

# cut ruby- ... everyone knows it's ruby
ruby_string = $1 if ruby_string =~ /^ruby[- ](.*)/

IRB.conf[:PROMPT][:MY_PROMPT] = { # name of prompt mode
  :PROMPT_I => "#{ruby_string} :%03n > ",  # default prompt
  :PROMPT_S => "#{ruby_string} :%03n%l> ", # known continuation
  :PROMPT_C => "#{ruby_string} :%03n > ",
  :PROMPT_N => "#{ruby_string} :%03n?> ", # unknown continuation
  :RETURN => " => %s \n",
  :AUTO_INDENT => true
}

IRB.conf[:PROMPT_MODE] = :MY_PROMPT
