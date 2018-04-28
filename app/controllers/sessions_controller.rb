class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to tests_path
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
