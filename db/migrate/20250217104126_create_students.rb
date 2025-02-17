class CreateStudents < ActiveRecord::Migration[7.1]
  def change
    create_table :students do |t|
      t.references :user, null: false, foreign_key: true
      t.string :phone_number
      t.string :program_of_study

      t.timestamps
    end
  end
end
