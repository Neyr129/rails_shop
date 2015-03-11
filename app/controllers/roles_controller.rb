class RolesController < InheritedResources::Base
before_filter :authenticate_user!
  load_and_authorize_resource
  


  def new
    @role = Role.new
  end

  def create
    @role = Role.new(role_params)
    ...
  end


  private
    def role_params
      params.require(:role).permit(:name, :description)
    end
end

