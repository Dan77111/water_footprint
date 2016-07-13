class UserMailer < ActionMailer::Base
  # password: CrE-rufe4e
  default :from => "wfc.noreply@gmail.com"

  def registration_confirmation(user)
    @user = user
    mail(:to => "#{user.username} <#{user.email}>", :subject => "Registration Confirmation")
 end
end
