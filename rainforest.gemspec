$:.unshift(File.join(File.dirname(__FILE__), 'lib'))

require 'rainforest/version'

spec = Gem::Specification.new do |s|
  s.name = 'rainforest'
  s.version = Rainforest::VERSION
  s.summary = 'Ruby bindings for the Rainforest API'
  s.description = 'Rainforest allows you to create tests for your website in plain English, then run them across all major browsers with a single click.  See https://www.rainforestqa.com/ for details.'
  s.authors = ['Jon Calhon']
  s.email = ['joncalhoun@gmail.com']
  s.homepage = 'https://github.com/joncalhoun/rainforest-ruby'
  s.license = 'MIT'

  s.add_dependency('rest-client', '~> 1.4')
  s.add_dependency('multi_json', '>= 1.0.4', '< 2')

  s.add_development_dependency('mocha', '~> 0.13.2')
  s.add_development_dependency('shoulda', '~> 3.4.0')
  s.add_development_dependency('test-unit')
  s.add_development_dependency('rake')

  s.files = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- test/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']
end
