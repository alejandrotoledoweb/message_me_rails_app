class MessagesController < ApplicationController
  before_action :require_user, only: [:create]
  def create
    @message = Message.new(message_params)
    @message.user = current_user
    return unless @message.save

    redirect_to root_path

    # return unless @message.save

    # ActionCable.server.broadcast 'chatroom_channel',
    #                              foo: message_render(@message)
  end

  private

    def message_params
      params.require(:message).permit(:description)
    end
end
