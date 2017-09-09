class MessageMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.message_mailer.new_message.subject
  #
  def new_message(message)
    @message = message
    mail to: 'frank@plumstreetgroup.com; fv42wid@yahoo.com', subject: 'New Message from plumstreetgroup.com'

  end
end
