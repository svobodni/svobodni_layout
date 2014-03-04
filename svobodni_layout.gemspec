$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "svobodni_layout/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "svobodni_layout"
  s.version     = SvobodniLayout::VERSION
  s.authors     = ["Jiri Kubicek"]
  s.email       = ["jiri@kubicek.cz"]
  s.homepage    = "https://github.com/svobodni/svobodni_layout"
  s.summary     = "Svobodni web template gem"
  s.description = "Fetches central web template, replaces placeholders and installs as application layout"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.3"

  s.add_development_dependency "sqlite3"
end
