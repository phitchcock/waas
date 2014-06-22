class UsersController < ApplicationController

  def index
    @users = User.paginate(page: params[:page], per_page: 5)
    @user = current_user
  end

  def show
    @user = current_user
    @ideas = @user.ideas.paginate(page: params[:page], per_page: 5)
  end

  def update
    if current_user.update_attributes(user_params)
      flash[:notice] = "User info updated"
      redirect_to edit_user_registration_path(current_user)
    else
      render "devise/registrations/edit"
    end
  end

  private

  def user_params
    params.require(:user).permit!
  end

end