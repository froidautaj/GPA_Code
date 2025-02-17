class CreateTutors < ActiveRecord::Migration[7.1]
  def change
    create_table :tutors do |t|
      t.references :user, null: false, foreign_key: true
      t.string :phone_number
      t.text :experience
      t.text :profile_preview
      t.string :qualification
      t.decimal :hourly_rate

      t.timestamps
    end
  end
end
