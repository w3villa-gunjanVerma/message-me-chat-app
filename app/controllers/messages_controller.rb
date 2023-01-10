class MessagesController < ApplicationController
    before_action :require_user
    def create
        message = Message.new(message_params.merge(user_id: current_user.id))
        if message.save
            redirect_to root_path
        end
    end
    private
    def message_params
        params.require(:message).permit(:body, :user_id)
    end
end