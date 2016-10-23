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
    if user_logged_in?
      @message = @current_user.inbox.messages.new
      @message.recipients.build
      @friends = @current_user.friend_ships
    end
  end

  def create
    if user_logged_in?
      @message = @current_user.inbox.messages.new(message_params)
      if @message.save
        @message.recipients.create(user_id: recipient_params[:recipients])
        flash[:notice] = "message sent successfully"
        redirect_to @current_user
      else
        flash[:notice] = "#{@message.errors.full_messages.to_sentence}"
        render 'new'
      end
    end
  end

  def destroy
  end

  private

  def message_params
    params.require(:message).permit(:subject, :content)
  end

  def recipient_params
     params.require(:message).permit(:recipients)
  end
end
