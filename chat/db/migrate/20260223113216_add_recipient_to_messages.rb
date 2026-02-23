class AddRecipientToMessages < ActiveRecord::Migration[8.1]
  def change
    add_reference :messages, :recipient, null: true, foreign_key: { to_table: :participants }
  end
end
