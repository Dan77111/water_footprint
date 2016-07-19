class RegistrationsController < Devise::RegistrationsController

  def create
    super

    if cookies[:result]
      Result.create(user_id: @user.id, score: cookies[:result])
      cookies.delete :result
    end

    if user_signed_in?
      flash[:validity] = true
      flash[:confirm] = "You successfully signed up!"
    end

    UserMailer.welcome(@user).deliver_now
  end

end
