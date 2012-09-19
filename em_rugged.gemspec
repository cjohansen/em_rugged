# -*- encoding: utf-8 -*-
require File.join("lib/em_rugged/version")

Gem::Specification.new do |s|
  s.name        = "em_rugged"
  s.version     = EMRugged::VERSION
  s.authors     = ["Christian Johansen"]
  s.email       = ["christian@gitorious.org"]
  s.homepage    = "http://gitorious.org/gitorious/em_rugged"
  s.summary     = %q{Asynchronous Rugged (libgit2 bindings) for EventMachine}
  s.description = %q{A wrapper around the Rugged API that returns deferrables for all the costly operations.}

  s.add_dependency "eventmachine", "~>1.0"
  s.add_dependency "rugged", "~>0"

  s.add_development_dependency "minitest", "~> 2.0"
  s.add_development_dependency "em-minitest-spec", "~> 1.1"
  s.add_development_dependency "rake", "~> 0.9"

  s.files         = `git ls-files -- lib/*`.split("\n")
  s.test_files    = `git ls-files -- test/*`.split("\n")
  s.require_paths = ["lib"]
end
