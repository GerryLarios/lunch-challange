class AdminMailer < ApplicationMailer
  default to: -> { User.admin_emails }
  
  def selection_completed
    @user_email = params[:selection].user.email
    @url = params[:url]
    mail(subject: "#{@user_email} has selected their meals.")
  end
end
