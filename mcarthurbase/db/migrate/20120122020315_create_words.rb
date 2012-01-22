class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.references :group
      t.string :name

      t.timestamps
    end
    add_index :words, :group_id
  end
end
