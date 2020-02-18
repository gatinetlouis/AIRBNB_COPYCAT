class ProfilesController < ApplicationController
  def show
      @user = User.find(params[:id])
      authorize @user
  end
end

# when policies setup

    # if policy(profile).show?
    # else
    #   redirect_to root_path
    # end


# policies profile

# def show?
#   current_user == User.find(params[:id])
# end
