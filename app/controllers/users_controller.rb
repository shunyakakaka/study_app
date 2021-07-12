class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]

  def index
    @users = User.all
    sum = 0
    i = 0
    k = 0
    no_records_user = 0
    first_index = 0
    passed_user_index = []
    has_records_user = []
    no_records_user = []
    same_number = []
    
    @users.each_with_index do |user, index|
      #レコードテーブルを持ったユーザーのとレコードテーブルを持たないユーザーを分ている
      if user.records.all.last == nil
        no_records_user << user
      else
        has_records_user << user
      end
    end
    has_records_user = has_records_user.sort{|a, b| b.records.all.last.total_time <=> a.records.all.last.total_time}
    @users = has_records_user | no_records_user
    @users.each_with_index do |user, index|
      if user.records.all.last == nil 
        if @users[index + 1] != nil
          @users[index..@users.length - 1].each do |user|
            user.overall_ranking += index + 1
          end
        else
          user.overall_ranking += index + 1
        end
        break
      elsif index == 0
        user.overall_ranking += index + 1
        k = user
        next
      elsif user.records.all.last.total_time == k.records.all.last.total_time
        user.overall_ranking = k.overall_ranking
      else
        user.overall_ranking += index + 1
      end
      k = user

    end

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
