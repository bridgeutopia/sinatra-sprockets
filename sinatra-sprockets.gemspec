# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "sinatra/sprockets/version"

Gem::Specification.new do |s|
  s.name        = "sinatra-sprockets"
  s.version     = Sinatra::Sprockets::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["thegorgon", "bridgeutopia"]
  s.email       = ["jessereiss@gmail.com", "info@bridgeutopiaweb.com"]
  s.homepage    = "http://github.com/thegorgon/sinatra-sprockets"
  s.summary     = %q{Sinatra helpers for Sprockets integration.}
  s.description = %q{Use Sprockets effectively with Sinatra.}

  s.rubyforge_project = s.name

  s.add_runtime_dependency 'sprockets',       '~> 2.8.2'
  s.add_runtime_dependency 'uglifier'
  s.add_runtime_dependency 'closure-compiler'
  s.add_runtime_dependency 'yui-compressor'
  s.add_runtime_dependency 'execjs'
  s.add_runtime_dependency 'activesupport'
  s.add_runtime_dependency 'uglifier'

  s.files = [
    "Gemfile",
    "sinatra-sprockets.gemspec",
    "lib/sinatra-sprockets.rb",
    "lib/sinatra/sprockets.rb",
    "lib/sinatra/sprockets/asset_paths.rb",
    "lib/sinatra/sprockets/configuration.rb",
    "lib/sinatra/sprockets/helpers.rb",
    "lib/sinatra/sprockets/rake.rb",
    "lib/sinatra/sprockets/static_compiler.rb",
    "lib/sinatra/sprockets/version.rb"
  ]

  s.require_paths << "lib"
end
