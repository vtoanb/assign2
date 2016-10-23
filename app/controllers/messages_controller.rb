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
      @message.recipients.build
    end
  end

  def create
    if user_logged_in?
      @message = @current_user.inbox.messages.new(message_params)

      if @message.save
        flash[:notice] =  "message sent successfully!"
        redirect_to @current_user
      else
        flash[:notice] = "#{errors.full_messages.to_sentence}"
        render 'new'
      end
    end
  end

  def destroy
  end

  private

  def message_params
    params.require(:message).permit(:subject, :content, recipients_attributes: [:id, :user_id])
  end
end
