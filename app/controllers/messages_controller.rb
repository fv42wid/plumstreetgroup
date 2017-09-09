class MessagesController < ApplicationController

  def create
    @message = Message.new(message_params)
    if @message.save
      render json: {message: @message}
    else
      render json: {errors: @message.errors.full_messages}, status: 422
    end
  end

  private

    def message_params
      params.require(:message).permit(:name, :email, :body)
    end
end