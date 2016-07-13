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
      session[:user_id] = @user.id

      flash[:validity] = true

      if cookies[:result]
        Result.create(user_id: @user.id, score: cookies[:result])
        cookies.delete :result
        redirect_to user_results_path(@user.id)
      else
        redirect_to root_path
      end

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
      #render :new
    end
  end

private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
