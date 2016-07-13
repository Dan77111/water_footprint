class UsersController < ApplicationController

  def new
    if current_user
      redirect_to root_path
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.registration_confirmation(@user).deliver

      if cookies[:result]
        Result.create(user_id: @user.id, score: cookies[:result])
        cookies.delete :result
      end

      flash[:validity] = true
      flash[:confirm] = "Please confirm your email in order to use your account."
      redirect_to root_path

    else
      mess = @user.errors.messages
      flash[:validity] = false
      flash[:username] = mess[:username][0] if mess[:username]
      flash[:email] = mess[:email][0] if mess[:email]
      flash[:password] = mess[:password][0] if mess[:password]

      if !(mess[:username] || mess[:email] || mess[:password])
        flash[:password_confirm] = "Password and Password Confirmation do not match."
      end

      redirect_to '/signup'
    end
  end

  def confirm_email
    user = User.find_by_confirm_token(params[:id])
    if user
      user.email_activate
      flash[:success] = "Welcome to the Sample App! Your email has been confirmed.
      Please sign in to continue."
      redirect_to root_url
    else
      flash[:error] = "Sorry. User does not exist"
      redirect_to root_url
    end
  end

private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
