class Message < ApplicationRecord
  after_create_commit { MessageBroadcastJob.perform_later self }
  puts "after_create_commit"
end
