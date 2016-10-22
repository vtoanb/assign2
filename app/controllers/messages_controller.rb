class MessagesController < ApplicationController
  def show
    message = Message.find(params[:id])
    if not message.status
      @message = message
      @message.status = true
      @message.read_time = Time.now.utc
      # user cannot readit later if this flag set
      if @message.save
        flash[:notice] = "This message being show only one time"
      end
    else
      flash[:notice] = "This message being removed, you cannot read it"
      redirect_to user_path(@current_user)
    end

  end

  def new
    @message = Message.new
  end

  def create
  end

  def destroy
  end
end
