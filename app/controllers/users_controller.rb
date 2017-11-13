class UsersController < ApplicationController
  def new
    @user = User.new
    if request.xhr?
      render(partial: 'new', object: @user)
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:notice] = "Your username exists already"
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

    def user_params
      params.require(:user).permit(:email, :username, :password)
    end

end
