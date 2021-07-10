class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]

  def index
    @users = User.all
    @users.each_with_index do |user, index|
      #ユーザーの記録がひとつもない時@usersのlengthを格納している
      if user.records.all.last == nil 
        user.overall_ranking = @users.length
      end
      sum += user.overall_ranking
      if index == @users.length - 1
        if sum = user.overall_ranking * @users.length 
          @users.each do |user|
            user.overall_ranking = 1
          end
        end
      end
    end
    binding.pry
  end

  def new
    @user = User.new(flash[:user])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "#{@user.name}でログインしました"
      redirect_to users_path
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
