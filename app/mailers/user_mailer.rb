class UserMailer < ActionMailer::Base
  # password: CrE-rufe4e
  default :from => "wfc.noreply@gmail.com"

  def welcome(user)
    @user = user
    mail(:to => "#{user.name} <#{user.email}>", :subject => "Welcome to WFC")
  end

end
