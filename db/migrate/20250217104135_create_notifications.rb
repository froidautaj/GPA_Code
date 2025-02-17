class CreateNotifications < ActiveRecord::Migration[7.1]
  def change
    create_table :notifications do |t|
      t.references :user, null: false, foreign_key: true
      t.string :user_type
      t.string :notification_type
      t.text :message
      t.datetime :sent_at

      t.timestamps
    end
  end
end
