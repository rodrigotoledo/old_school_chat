class Message < ApplicationRecord
  belongs_to :participant
  belongs_to :recipient, class_name: "Participant", optional: true

  # Broadcasting no model: quem assina "chat" recebe o append em #messages
  after_create_commit -> { broadcast_append_to "chat", target: "messages" }
end
