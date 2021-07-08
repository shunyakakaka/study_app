class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]

  def index
    @users = User.all
  end

  def new
    @user = User.new(flash[:user])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "ユーザー登録しました。ログインしましょう"
      redirect_to login_path
    else
      flash[:user] = @user
      flash[:error_message] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end
    
  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  private

  def user_params
    params.require(:user).permit(:name, :sex, :age, :description, :job, :password, :password_confirmation)
  end

end
