class SessionsController < ApplicationController
  skip_before_action :login_required
  def new
  end

  def create
    user = User.find_by(name: session_params[:name])

    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id 
      flash[:notice] = "#{user.name}でログインしました"
      redirect_to users_path
    else
      flash[:error_message] = "正しく入力してください"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to root_path
  end

  def session_params
    params.require(:session).permit(:name, :password, :password_confirmation)
  end
end
