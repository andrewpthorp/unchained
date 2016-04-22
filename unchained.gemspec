lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'unchained/version'

Gem::Specification.new do |s|
  s.name        = 'unchained'
  s.version     = Unchained::VERSION.dup

  s.author      = 'Andrew Thorp'
  s.email       = 'andrewpthorp@gmail.com'
  s.homepage    = 'http://github.com/andrewpthorp/unchained'

  s.licenses    = ['MIT']
  s.summary     = "Client library for Camelot Unchained API."
  s.description = <<-DESC
    A gem that lets you call into the Camelot Unchained API. You can see the API
    docs at https://api.camelotunchained.com
  DESC

  s.files = %w(LICENSE.md README.md unchained.gemspec)
  s.files += Dir.glob("lib/**/*.rb")
  s.files += Dir.glob("test/**/*")

  s.test_files    = Dir.glob("test/**/*")
  s.require_paths = ["lib"]

  s.add_development_dependency 'rake', '~> 11.0'
  s.add_development_dependency 'minitest', '~> 5.8'
  s.add_development_dependency 'pry', '~> 0.10'
  s.add_dependency 'rest-client', '~> 1.8'
end
