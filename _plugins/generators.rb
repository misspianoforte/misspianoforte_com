module Jekyll
	class GalleryGenerator < Generator
		def generate(site)
			images = {}
			image_types = [".jpg",".png",".gif"]
			galleries = {}
			def site.galleries
				galleries
			end
			galleries_path = File.join(site.source, site.config['galleries_dir'])
			folders = Dir.entries(galleries_path).select{|e| File.directory?(e) }
			folders.each do |f|
				files = Dir.entries(File.join(galleries_path,f)).reject{|x| 
					File.directory?(x) && image_types.include?(File.extname(x))
				}
				galleries[f] = files
			end
		end
	end
end
