class ContactEmailJob < ApplicationJob
  queue_as :default

  def perform(message_id)
    # Do something later
    message = Message.find(message_id)
    MessageMailer.new_message(message).deliver_later
  end
end
