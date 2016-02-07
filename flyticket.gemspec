# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'flyticket/version'

Gem::Specification.new do |spec|
  spec.name          = "flyticket"
  spec.version       = Flyticket::VERSION
  spec.authors       = ["John Cipriano"]
  spec.email         = ["johnmikecip@gmail.com"]

  spec.summary       = "Get Ruby objects from Ticketfly's JSON API"
  spec.homepage      = "https://github.com/johncip/flyticket"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'http://rubygems.org'
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"

  # avoid pissing off ticketfly
  spec.add_development_dependency "vcr", "~> 3.0"
  spec.add_development_dependency "webmock", "~> 1.22"

  # racing stripes
  spec.add_development_dependency "pry", "~> 0.10"
  spec.add_development_dependency "pry-coolline", "~> 0.2"
  spec.add_development_dependency "awesome_print", "~> 1.6"

  spec.add_runtime_dependency "plissken", "~> 0.2"
  spec.add_runtime_dependency "httparty", "~> 0.13"
end
