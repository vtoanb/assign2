class SessionsController < ApplicationController

  skip_before_action :authenticate, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(email: session_params[:email].downcase)
    # let find user by cookies
    # user = User.find_by(id: cookies.signed[:user_id])
    if user && user.authenticate(session_params[:password])
      flash[:notice] = "logged in successfully"
      log_in user
      remember user
      redirect_to user
    else
      render 'new', flash: "Identity not correct, login again!"
    end
  end

  def destroy
    log_out if user_logged_in?
    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
