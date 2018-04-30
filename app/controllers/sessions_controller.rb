class SessionsController < ApplicationController
  def new
    redirect_to root_path if logged_in?
  end


  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_back(fallback_location: root_path, notice: "Successfully Logged In")
    else
      flash.now[:alert] = "Are u Guru? Verify email and password before next try"
      render :new
    end
  end

  def log_out
    session.clear
    redirect_to login_path
  end
end
