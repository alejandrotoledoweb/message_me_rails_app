class ChatroomController < ApplicationController
  def index
    redirect_to login_path unless logged_in?
    @message = Message.new
    @messages = Message.all
  end
end
