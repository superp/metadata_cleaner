# encoding: utf-8
require 'rails'
require 'metadata_cleaner'

module MetadataCleaner
  class Engine < ::Rails::Engine      
    rake_tasks do
      load "tasks/metadata_cleaner.rake"
    end
  end
end
