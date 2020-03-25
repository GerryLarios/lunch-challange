class AdminMailer < ApplicationMailer
  default to: -> { User.admin_emails }
  
  def selection_completed
    @selection = params[:selection]
    @user_email = params[:selection].user.email
    mail(subject: "#{@user_email} has selected their meals.")
  end
end
