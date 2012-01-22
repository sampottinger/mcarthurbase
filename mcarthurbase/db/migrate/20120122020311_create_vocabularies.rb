class CreateVocabularies < ActiveRecord::Migration
  def change
    create_table :vocabularies do |t|
      t.references :subject
      t.string :study
      t.date :session_date
      t.references :language
      t.integer :session_num
      t.string :mcdi_type
      t.integer :percentile
      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps
    end
    add_index :vocabularies, :subject_id
    add_index :vocabularies, :language_id
  end
end
