# encoding: utf-8
module MetadataCleaner
  class Cleaner
    IMAGE_FORMATS = 'gif,png,jpeg,jpg,JPG,GIF,PNG,JPEG,TIFF,TIF,tif,tiff,SVG,svg'
    
    attr_accessor :path, :images
    
    def initialize(path)
     @path = path
     image_files = File.join(@path, "**", "*.{#{IMAGE_FORMATS}}")
     @images = Dir.glob(image_files)
    end
    
    def start
      before_size = dirsize
      log "#{before_size} Mb"
      
      convert
      
      after_size = dirsize
      log "#{after_size} Mb"
      
      percent = ((before_size - after_size)/before_size)*100
      log "Optimization result: #{percent} %"
    end
    
    def dirsize(options={})
      size = 0
      
      @images.each do |f| 
        size += File.stat(f).size
      end
      
      size/(1024*1024.0)
    end
    
    def convert(options={})   
      total_length = @images.size.to_f
      
      @images.each_with_index do |file, index|
        system "convert #{file} -strip #{file}"
        print "\r\t-processed: %3i%%" % (100*(index.to_f+1.0)/total_length) 
      end
      log ''
    end
    
    def log(message)
      STDOUT.puts message
    end
      
  end
end
