# frozen_string_literal: true

module Api
  class ParticipantsController < ApplicationController
    def index
      render json: Participant.order(:name).as_json(only: %i[id name])
    end
  end
end
