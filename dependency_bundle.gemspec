# encoding: utf-8

$:.unshift File.expand_path('../lib', __FILE__)
require 'dependency_bundle/version'

Gem::Specification.new do |s|
  s.name          = 'dependency_bundle'
  s.version       = DependencyBundle::VERSION
  s.authors       = ['Ben Smith']
  s.email         = ['bsmith@optoro.com']
  s.homepage      = 'https://github.com/babelfish/dependency_bundle'
  s.summary       = ''
  s.description   = ''

  s.files         = `git ls-files app lib`.split("\n")
  s.platform      = Gem::Platform::RUBY
  s.require_paths = ['lib']

  s.add_development_dependency 'rspec', '~> 3.7'
  s.add_development_dependency 'rake'
end
