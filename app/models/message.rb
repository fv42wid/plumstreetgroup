class Message < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :body, presence: true

  def send_new_message
    #MessageMailer.new_message(self).deliver_later
    ContactEmailJob.perform_later(self.id)
  end

end
