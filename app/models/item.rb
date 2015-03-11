class Item < ActiveRecord::Base 
	ratyrate_rateable 'stars'
	has_many :images
	belongs_to :user  
	has_many :ratings
	has_many :positions
	has_many :carts, through: :positions

	def average_rating
		ratings.sum(:score) / ratings.size
	end
end
