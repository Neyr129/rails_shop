class User < ActiveRecord::Base
	ratyrate_rater
	before_save :assign_role
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one  	 :history
  has_one  	 :cart
  has_many 	 :ratings
  has_many   :items 
  belongs_to :role


	def assign_role
 	 	self.role = Role.find_by name: "Regular" if self.role.nil?
	end

	def admin?
	  self.role.name == "Admin"
	end

	def regular?
	  self.role.name == "Regular"
	end

end
