class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: session_params[:email].downcase)
  	if user && user.authenticate(session_params[:password])
  		redirect_to root_path, notice: "loged in successfully"
  	else
  		render 'new', flash: "Identity not correct, login again!"
  	end
  end

  def destroy
  end

  private

  def session_params
  	params.require(:session).permit(:email, :password)
  end
end
