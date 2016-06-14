listfiles = `ls *.txt`.strip.split("\n")

def dl url, fn
  puts "#{fn} #{url}"
  cmd = "wget -nv -O #{fn} #{url}"
  `#{cmd}`
end


listfiles.each do |f|
  dir = f.split(".").first
  `mkdir -p #{dir}`
  urls = File.read(f).split("\n")
  cnt = 0
  urls.each do |url|
    extname = url.split('.').last
    if extname.nil? or extname.length > 3
      extname = "jpg"
    end

    dl url, dir+"/"+cnt.to_s.rjust(4,'0')+".#{extname}"
    cnt = cnt + 1
  end

end
