class InboxesController < ApplicationController

  def index
  end

  def show
    @messages = User.find(params[:user_id]).messages
  end

end
