module ItemsHelper 
	def check_user_id(user, item)
		item.user_id == user.id
	end
end
