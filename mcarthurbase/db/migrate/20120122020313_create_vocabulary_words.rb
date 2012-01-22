class CreateVocabularyWords < ActiveRecord::Migration
  def change
    create_table :vocabulary_words do |t|
      t.references :vocabulary
      t.references :word
      t.boolean :known

      t.timestamps
    end
    add_index :vocabulary_words, :vocabulary_id
    add_index :vocabulary_words, :word_id
  end
end
