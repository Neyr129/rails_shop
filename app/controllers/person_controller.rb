class PersonController < ApplicationController

	def index
		@users = Person.all
	end


	def show
	    @user = Person.find(params[:id])
	    unless @person == current_person
	      redirect_to :back, :alert => "Access denied."
	    end
  	end

end
