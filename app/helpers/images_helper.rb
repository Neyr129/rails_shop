module ImagesHelper
	def generate_image(item)
		if item.images.last.nil?
			return '/images/missing_small.jpg'
		else
			item.images.last.img.url(:small)
		end
	end 
end
