class SessionsController < ApplicationController
  def new
  end

  def create # login
      user = User.find_by_email(params[:email])
      # If the user exists AND the password entered is correct.
      if user && user.authenticate(params[:password])
        # Save the user id inside the browser cookie. This is how we keep the user
        # logged in when they navigate around our website.
        session[:user_id] = user.id
        redirect_to '/'
      else
      # If user's login doesn't work, send them back to the login form.
        flash[:login] = "Wrong email or password."
        redirect_to '/login'
      end
    end

  def destroy # logout
    session[:user_id] = nil
    redirect_to '/'
  end
end
