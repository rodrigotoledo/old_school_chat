# frozen_string_literal: true

module Api
  class MessagesController < ApplicationController
    def index
      messages = Message.includes(:participant, :recipient).order(created_at: :asc)
      render json: messages.as_json(
        only: %i[id body created_at],
        include: {
          participant: { only: %i[id name] },
          recipient: { only: %i[id name] }
        }
      )
    end

    def create
      participant = Participant.find(params[:participant_id])
      attrs = message_params
      attrs[:recipient_id] = nil if attrs[:recipient_id].blank?
      message = participant.messages.build(attrs)

      if message.save
        # Broadcast é feito no model (after_create_commit)
        render json: message.as_json(
          only: %i[id body created_at],
          include: {
            participant: { only: %i[id name] },
            recipient: { only: %i[id name] }
          }
        ), status: :created
      else
        render json: { errors: message.errors.full_messages }, status: :unprocessable_entity
      end
    end

    private

    def message_params
      params.require(:message).permit(:body, :recipient_id)
    end
  end
end
