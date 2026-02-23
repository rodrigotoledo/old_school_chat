# frozen_string_literal: true

class MessagesController < ApplicationController
  def create
    participant = Participant.find(params[:participant_id])
    attrs = message_params
    attrs[:recipient_id] = nil if attrs[:recipient_id].blank?
    @message = participant.messages.build(attrs)

    if @message.save
      # Só o model faz broadcast; todos (inclusive quem enviou) veem a mensagem pelo Action Cable
      head :no_content
    else
      redirect_to root_path, alert: "Não foi possível enviar."
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :recipient_id)
  end
end
