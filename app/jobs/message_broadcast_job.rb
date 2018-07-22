class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    puts "job#perform #{message.content}"
    ActionCable.server.broadcast 'room_channel', message: render_message(message)
  end

  private 
    def render_message(message)
      puts "job#render_message #{message.content}"
      ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message})
    end
end
