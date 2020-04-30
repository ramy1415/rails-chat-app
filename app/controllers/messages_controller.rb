class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    message=current_user.messages.build(message_params);
    if message.save()
      ActionCable.server.broadcast 'room_channel',message: message_render(message)
    end
  end

  private def message_params
    params.require(:message).permit(:body);
  end

  private def message_render(message)
    render(partial: 'message', locals: {message: message})
  end
end
