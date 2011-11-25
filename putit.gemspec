$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "putit/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "putit"
  s.version     = Putit::VERSION
  s.authors     = ["hitsujiwool"]
  s.email       = ["utatanenohibi@gmail.com"]
  s.homepage    = ""
  s.summary     = ""
  s.description = ""

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.1.1"

  s.add_development_dependency "sqlite3"
end
