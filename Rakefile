require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

require File.join(File.dirname(__FILE__), "lib", "metadata_cleaner")

desc 'Default: run unit tests.'
task :default => :test

task :metadata_clean do
  path = (ENV['path'] || '')
    
  cleaner = MetadataCleaner::Cleaner.new(path)
  cleaner.start
end

desc 'Test the metadata_cleaner plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation for the metadata_cleaner plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'MetadataCleaner'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "metadata_cleaner"
    gemspec.version = MetadataCleaner::Version.dup
    gemspec.summary = "Clear metadata (profiles) from images"
    gemspec.description = "Remove all images metadata (profiles) in directory"
    gemspec.email = "superp1987@gmail.com"
    gemspec.homepage = "git://github.com/Brainberry/metadata_cleaner.git"
    gemspec.authors = ["Pavlo Galeta", "Igor Galeta"]
    gemspec.files = FileList["[A-Z]*", "{lib}/**/*"]
    gemspec.rubyforge_project = "metadata_cleaner"
  end
  
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler not available. Install it with: gem install jeweler"
end
