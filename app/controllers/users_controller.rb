class UsersController < ApplicationController
	
	def new
		@user = User.new
	end

	def create
		@user = User.create(user_params)

		if @user.save
			redirect_to root_path, notice: "User created successfully"
		else
			render 'new'
		end
	end

	def show
		@user = User.find(:id)
	end

	def index
		@user = User.all
	end

	private

	def user_params
		params.require(:user).permit(:password, :email, :name)
	end
end
