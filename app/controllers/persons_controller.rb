class PersonsController < ApplicationController
  def show
    @person = person.find(params[:id])
    unless @person == current_person
      redirect_to :back, :alert => "Access denied."
    end
  end
end
