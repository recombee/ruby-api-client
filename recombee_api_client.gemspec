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
  spec.description   = 'A Ruby client for accessing the Recombee recommendation API. Supports personalization and search capabilities with ease.'
  spec.homepage      = 'https://recombee.com'
  spec.license       = 'MIT'

  spec.required_ruby_version = '>= 2.5.0'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ['lib']

  spec.add_dependency 'multi_json', '~> 1.15'
  spec.add_dependency 'httparty', '~> 0.18'

  spec.add_development_dependency 'bundler', '~> 2.6.2'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.11'
end
