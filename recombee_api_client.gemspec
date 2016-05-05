# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'recombee_api_client/version'

Gem::Specification.new do |spec|
  spec.name          = 'recombee_api_client'
  spec.version       = RecombeeApiClient::VERSION
  spec.authors       = ['Ondřej Fiedler']
  spec.email         = ['ondrej.fiedler@recombee.com']

  spec.summary       = 'Client for Recombee recommendation API'
  spec.homepage      = 'http://recombee.com'
  spec.license       = 'MIT'
  spec.required_ruby_version = '>= 1.9.0'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ['lib']

  spec.add_dependency 'multi_json'
  spec.add_dependency 'httparty'

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
end