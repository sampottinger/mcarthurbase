class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :name
      t.string :gender
      t.date :birthdate
      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps
    end
  end
end
