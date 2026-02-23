# frozen_string_literal: true

class ChatController < ApplicationController
  def index
    @participants = Participant.order(:name)
    @messages = Message.includes(:participant).order(created_at: :asc)
  end
end
