# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wakeup/version'

Gem::Specification.new do |spec|
  spec.name          = "wakeup"
  spec.version       = Wakeup::VERSION
  spec.authors       = ["Ankur Patel"]
  spec.email         = ["ankur.patel@ymail.com"]

  spec.summary       = %q{Wake-on-LAN command line tool}
  spec.description   = %q{Wake-on-LAN command line tool to wake up a server given a domain/ip-address and MAC address.}
  spec.homepage      = "https://github.com/ankurp/wakeup"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
end
