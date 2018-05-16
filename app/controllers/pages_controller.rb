class PagesController < ApplicationController

  def contact

  end

  def send_mail
    @message = params[:message]
    if user_signed_in?
      @email = current_user.email
      @feedback_params = { user: current_user, email: current_user.email, body: @message }
    else
      @email = params[:email]
      @feedback_params = { email: @email, body: @message }
    end
    Feedback.create(@feedback_params)
    @letter = { message:@message, email: @email }
    ContactUsMailer.mailto_admin(@letter).deliver_now
    flash[:notice] = "Your letter was  successfully sent to us"
    redirect_to root_path
  end

end