class CreateCalendarEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :calendar_events do |t|
      t.references :tutor, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true
      t.references :booking, null: false, foreign_key: true
      t.datetime :event_time

      t.timestamps
    end
  end
end
