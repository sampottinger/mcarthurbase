class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.references :language
      t.integer :section
      t.string :name
      t.string :footnote

      t.timestamps
    end
    add_index :groups, :language_id
  end
end
