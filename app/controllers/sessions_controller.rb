class SessionsController < Devise::SessionsController

  def create
    super

    if cookies[:result]
      Result.create(user_id: @user.id, score: cookies[:result])
      cookies.delete :result
    end

    if @user.save
      flash[:validity] = true
      flash[:confirm] = "You successfully logged in!"
    end
  end

end
