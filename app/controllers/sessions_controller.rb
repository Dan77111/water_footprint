class SessionsController < ApplicationController
  def new
    redirect_to root_path if current_user
  end

  def create # login
      user = User.find_by_email(params[:email])
      # If the user exists AND the password entered is correct.
      if user && user.authenticate(params[:password])
        if cookies[:result]
          Result.create(user_id: user.id, score: cookies[:result])
        end

        if user.email_confirmed
          # Save the user id inside the browser cookie. This is how we keep the user
          # logged in when they navigate around our website.
          session[:user_id] = user.id

          if cookies[:result]
            redirect_to user_results_path(user.id)
            cookies.delete :result
          else
            redirect_to root_path
          end

        else
          flash[:login] = "Please confirm your email."
          redirect_to login_path
          return
        end

      else
      # If user's login doesn't work, send them back to the login form.
        flash[:login] = "Wrong email or password."
        redirect_to login_path
      end
    end

  def destroy # logout
    session[:user_id] = nil
    redirect_to root_path
  end
end
