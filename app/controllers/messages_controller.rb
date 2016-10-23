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
      # 2.times { @message.recipients.build }
      @friends = @current_user.friend_ships
      @friends.each do |f|
        @message.recipients.build
      end
    end
  end

  def create
    if user_logged_in?
      @message = @current_user.inbox.messages.new(message_params)
      if @message.save
        @message.recipients.create(recipient_params)
        # count = recipient_params.count
        # count.times do |c|
        #   @message.recipients.create(recipient_params.require(c.to_s).permit(:user_id))
        # end
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
    # params.require(:message).require(:recipients_attributes).require(:"0").permit(:user_id)
    # params.require(:message).require(:recipients_attributes)
    params.require(:message).permit(recipients_attributes: [:user_id])
  end
end
