# encoding: utf-8
require File.join(File.dirname(__FILE__), 'lib/youku/version')

Gem::Specification.new do |gem|
  gem.add_dependency 'typhoeus'
  gem.add_dependency 'hashie'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'webmock'
  gem.authors = ['Alexey Vokhmin']
  gem.description = %q{A Ruby wrapper for the Youku v2 API}
  gem.email = ['avokhmin@gmail.com']
  gem.executables = `git ls-files -- bin/*`.split("\n").map{|f| File.basename(f)}
  gem.files = `git ls-files`.split("\n")
  gem.homepage = "https://github.com/Shuttlerock/youku_client"
  gem.license = "Apache"
  gem.name = "youku_client"
  gem.require_paths = ["lib"]
  gem.required_rubygems_version = Gem::Requirement.new('>= 1.3.6')
  gem.summary = %q{Youku API wrapper}
  gem.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.version = Youku::VERSION
end
