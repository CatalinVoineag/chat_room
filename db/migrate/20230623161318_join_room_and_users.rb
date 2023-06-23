class JoinRoomAndUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms_users, id: false do |t|
      t.belongs_to :room
      t.belongs_to :user
    end
  end
end
