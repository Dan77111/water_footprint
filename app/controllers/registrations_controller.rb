class RegistrationsController < Devise::RegistrationsController

  # override Devise RegistrationsController create method
  def create
    super

    # add result and delete cookie if user comes from calculator
    if cookies[:result]
      Result.create(user_id: @user.id, score: cookies[:result])
      cookies.delete :result
    end

    # flash message if sigup is successful
    if user_signed_in?
      flash[:validity] = true
      flash[:success] = "You successfully signed up!"

      # send welcome email to user email account
      UserMailer.welcome(@user).deliver_now
    end

  end

end
