class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to projects_path, flash: { success: "You have successfully logged in." }
    else
      flash.now["error"] = "Invalid email or password"
      render :new, status: :unauthorized
    end
  end

  def destroy
    log_out
    redirect_to login_path, flash: { success: "You have successfully logged out." }
  end
end
