class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.references :student, null: false, foreign_key: true
      t.references :tutor, null: false, foreign_key: true
      t.references :subject, null: false, foreign_key: true
      t.datetime :session_date
      t.integer :status
      t.string :zoom_link

      t.timestamps
    end
  end
end
