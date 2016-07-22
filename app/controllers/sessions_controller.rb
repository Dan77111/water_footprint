class SessionsController < Devise::SessionsController

  # override Devise SessionsController create method
  def create
    super

    # add result and delete cookie if user comes from calculator
    if cookies[:result]
      Result.create(user_id: @user.id, score: cookies[:result])
      cookies.delete :result
    end

    # flash message if login is successful
    if signed_in?
      flash[:validity] = true
      flash[:success] = "You successfully logged in!"
    end

  end

end
