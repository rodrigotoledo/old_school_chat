# frozen_string_literal: true

participants = %w[Você Ana Bruno Maria Pedro]
participants.each do |name|
  Participant.find_or_create_by!(name: name)
end
