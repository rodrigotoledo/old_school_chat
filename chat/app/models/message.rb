class Message < ApplicationRecord
  belongs_to :participant
  belongs_to :recipient, class_name: "Participant", optional: true

  # Broadcasting in the model: subscribers to "chat" receive appends to #messages
  after_create_commit -> { broadcast_append_to "chat", target: "messages" }
end
