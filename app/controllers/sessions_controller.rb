class SessionsController < ApplicationController
  skip_before_action :login_required
  def new
  end

  def create
    user = User.find_by(name: session_params[:name])

    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id 
      redirect_to users_path
    else
      flash[:notice] = "正しく入力してください"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end

  def session_params
    params.require(:session).permit(:name, :password, :password_confirmation)
  end
end
