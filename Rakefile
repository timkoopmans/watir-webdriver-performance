require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  gem.name = "watir-webdriver-performance"
  gem.homepage = "http://github.com/90kts/watir-webdriver-performance"
  gem.license = "MIT"
  gem.summary = %Q{A simple helper gem for watir-webdriver performance metrics}
  gem.description = %Q{This gem collects and summarises metrics speficied in the W3C Navigation web performance specifications at http://w3c-test.org/webperf/specs/NavigationTiming/ when using watir-webdriver and a compatible browser}
  gem.email = "tim.koops@gmail.com"
  gem.authors = ["Tim Koopmans"]
  gem.add_runtime_dependency 'watir-webdriver'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'zomg'
  gem.add_development_dependency 'nokogiri'
  gem.add_development_dependency 'active_support'
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :default => :spec

require 'rdoc/task'
RDoc::Task.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "watir-webdriver-performance #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
