class UserMailer < ApplicationMailer
  def selection_reminder
    @user = params[:user]
    host = ENV['APP_HOST'] || '127.0.0.1:3000'
    @url = url_for(action: 'new', controller: 'selections', host: host)
    mail(to: @user.email, subject: 'Don\'t forget select your meals for the next month!')
  end
end
