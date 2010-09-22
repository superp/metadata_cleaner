# encoding: utf-8
module MetadataCleaner
  autoload :Cleaner, 'metadata_cleaner/cleaner'
  autoload :Version, 'metadata_cleaner/version'
end

require 'metadata_cleaner/railtie'

