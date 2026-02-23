# frozen_string_literal: true

class MessagesController < ApplicationController
  def create
    participant = Participant.find(params[:participant_id])
    attrs = message_params
    attrs[:recipient_id] = nil if attrs[:recipient_id].blank?
    @message = participant.messages.build(attrs)

    if @message.save
      # Quem enviou vê na resposta Turbo Stream; os outros veem pelo broadcast do model
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to root_path }
      end
    else
      redirect_to root_path, alert: "Não foi possível enviar."
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :recipient_id)
  end
end
