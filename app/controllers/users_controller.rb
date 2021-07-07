class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
  end
    
  def show
  end

  def edit
  end

  private

  def user_params
    params.require(:user).permit(:name, :string, :password, :password_confirmation)
  end
end
