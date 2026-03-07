# frozen_string_literal: true

participants = %w[You Ana Bruno Maria Pedro]
participants.each do |name|
  Participant.find_or_create_by!(name: name)
end
participants_records = Participant.all
10.times do |i|
  sender = participants_records.sample
  recipient = (participants_records - [sender]).sample
  Message.create!(
    participant_id: sender.id,
    recipient_id: recipient.id,
    body: Faker::Lorem.paragraph
  )
end