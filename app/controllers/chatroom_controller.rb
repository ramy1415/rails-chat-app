class ChatroomController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @messages=Message.custom_display
  end
end
