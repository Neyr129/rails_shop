class Ability 
include CanCan::Ability
  def initialize(user)   	
	  
	  user  ||= User.new
	  user.assign_role	  
			if user.admin?				
			  can :manage, :all
			  can :access, :rails_admin
			  can :dashboard
 	
			elsif user.regular?

			  can :read, User, :user_id => user.id

			  can :read, Item
			  can :create, Item 
			  can :manage, Cart do |cart|
			  	cart.try(:user) == user
			  end
			  can :update, Item do |item|
			    item.try(:user) == user
			  end
			  can :destroy, Item do |item|
			    item.try(:user) == user
			  end

			  can :read, History do |history| 
			  	history.try(:user) == user
			 	end
			 	
			end
	end 
end
