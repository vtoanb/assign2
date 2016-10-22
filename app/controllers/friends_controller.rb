class FriendsController < ApplicationController
  def index
    @users = User.all
  end

  def show
    if @current_user
      friend = User.find(params[:id])
      @friend = @current_user.friend_ships.new(friend_id: friend.id) if friend
      if @friend.save
        flash[:notice] = "congratulation, you and #{@friend.friend.name} become friend!"
        redirect_to @current_user
      else
        flash[:notice] = "add friend not successfully, try again later!"
        redirect_to 'friends#index'
      end
    end
  end

  def create
  end

end
