class MessagesController < ApplicationController
  def index
    @messages = Message.all
    puts @messages
  end
end
