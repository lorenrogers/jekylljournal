# Ensure we require the local version and not one we might have installed already
require File.join([File.dirname(__FILE__),'lib','jekylljournal','version.rb'])
spec = Gem::Specification.new do |s|
  s.name = 'jekylljournal'
  s.version = Jekylljournal::VERSION
  s.author = 'Loren Rogers'
  s.email = 'loren@lorentrogers.com'
  s.homepage = 'http://www.lorentrogers.com'
  s.platform = Gem::Platform::RUBY
  s.summary = 'A super awesome way of writing daily blog posts with Jekyll.'
  s.license = 'GPL-3.0'
  spec.required_ruby_version = '>= 2.2.0'
  s.files = `git ls-files`.split("
")
  s.require_paths << 'lib'
  s.has_rdoc = true
  s.extra_rdoc_files = ['README.rdoc','jekylljournal.rdoc']
  s.rdoc_options << '--title' << 'jekylljournal' << '--main' << 'README.rdoc' << '-ri'
  s.bindir = 'bin'
  s.executables << 'jekylljournal'
  s.add_development_dependency('rake')
  s.add_development_dependency('rdoc')
  s.add_development_dependency('aruba')
  s.add_runtime_dependency('gli','2.13.4')
end
