require 'graphicsmagick'

jpg = Dir.glob("*/*.jpg") +  Dir.glob("*/*.JPG")
jpeg = Dir.glob("*/*.jpeg")
png = Dir.glob("*/*.png")
gif = Dir.glob("*/*.gif")


all_images =  jpg + jpeg + png + gif

all_images.each do |img|

  size_width = GraphicsMagick::Image.new(img).width
  if size_width == 0
    puts img + " " + size_width.to_s
    fail_name = (img.split("/")[0..-2])*"/" + "failed_"+ (img.split("/").last)
    FileUtils.mv(img, fail_name )
  end
end

