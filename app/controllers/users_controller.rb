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
    @user = User.find(params[:id])
    if @user == @current_user
      @messages = @user.messages.order(created_at: :desc).page(params[:page]).per(10)
      # sent item
      @sent_messages = @user.inbox.messages
    else
      @messages  = nil
      @sent_messages = nil
    end

    @friends = @user.friend_ships

  end

  def index
    @user = User.all
  end

  private

  def user_params
    params.require(:user).permit(:password, :email, :name)
  end
end
