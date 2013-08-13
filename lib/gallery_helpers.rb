module GalleryHelpers
	def galleries
		site_path = "./source"
		galleries_path = File.expand_path File.join(site_path, "files/galleries")
		images = {}
		image_types = [".jpg",".png",".gif"]
		galleries = {}
		folders = Dir.entries(galleries_path).select{|e| !e.start_with?('.') && File.directory?(File.join(galleries_path, e)) }
		folders.each do |f|
			files = Dir.entries(File.join(galleries_path,f)).select{|x| 
				image_types.include?(File.extname(x).downcase)
			}
			galleries[f] = files if files.count > 0
		end
		galleries
	end
end
