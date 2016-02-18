require 'aruba/cucumber'

ENV['PATH'] = "#{File.expand_path(File.dirname(__FILE__) + '/../../bin')}#{File::PATH_SEPARATOR}#{ENV['PATH']}"
LIB_DIR = File.join(File.expand_path(File.dirname(__FILE__)),'..','..','lib')

Before do
  # Using "announce" causes massive warnings on 1.9.2
  @puts = true
  @original_rubylib = ENV['RUBYLIB']
  ENV['RUBYLIB'] = LIB_DIR + File::PATH_SEPARATOR + ENV['RUBYLIB'].to_s

  # Set the home directory to test the dotfiles.
  # https://ariejan.net/2014/04/15/testing-home-with-cucumber-and-aruba/
  set_environment_variable 'HOME', File.expand_path(File.join(expand_path("."), 'home'))
  FileUtils.mkdir_p ENV['HOME']
end

After do
  ENV['RUBYLIB'] = @original_rubylib
end
