# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rapid_api/version'

Gem::Specification.new do |spec|
  spec.name          = 'rapidapi_connect'
  spec.version       = RapidAPI::VERSION
  spec.authors       = ['Unathi Chonco']
  spec.email         = ['dev@unathichonco.com']

  spec.summary       = %q{Connect to blocks on the rapidapi.com marketplace}
  spec.description   = %q{This Gem allows you to connect to RapidAPI blocks in your ruby app.}
  spec.homepage      = 'https://github.com/choncou/RapidAPIConnect_ruby'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'byebug', '~> 9.0', '>= 9.0.6'
end
