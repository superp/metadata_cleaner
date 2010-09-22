namespace :metadata do
  task :clean do
    path = (ENV['path'] || '')
    
    cleaner = MetadataCleaner::Cleaner.new(path)
    cleaner.start
  end
end
