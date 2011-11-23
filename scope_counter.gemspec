# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "scope_counter/version"

Gem::Specification.new do |s|
  s.name        = "scope_counter"
  s.version     = ScopeCounter::VERSION
  s.authors     = ["Yuri Barbashov"]
  s.email       = ["lolcoltd@gmail.com"]
  s.homepage    = "https://github.com/playa/scope_counter"
  s.summary     = %q{Provide counter_cache functionality for model scopes}
  s.description = %q{Simple implementation of counter_cache functionality for model scopes}

  s.rubyforge_project = "scope_counter"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "bundler", ">= 1.0.0"
  s.add_development_dependency "rspec"
  s.add_development_dependency "sqlite3-ruby"
  s.add_dependency "activerecord", "~> 3.0"
end
