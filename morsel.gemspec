# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'morsel/version'

Gem::Specification.new do |s|
  s.name        = 'morsel'
  s.version     = Morsel::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Anoop Ranganath']
  s.email       = ['anoop@ranganath.com']
  s.homepage    = 'http://github.com/anoopr/morsel'
  s.summary     = %q{A way to manage your source dependencies}
  s.description = %q{A way to manage your source dependencies, inspired by rubygems, bundler, and homebrew.}

  s.required_rubygems_version = '>= 1.3.6'
  s.rubyforge_project         = 'nowarning'

  s.add_dependency 'git', '>= 1.2.5'

  s.add_development_dependency 'rspec', '>= 2.3.0'

  s.files              = `git ls-files`.split("\n")
  s.test_files         = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables        = %w(morsel)
  s.default_executable = 'morsel'
  s.require_paths      = ['lib']
end
