class CreateSubsites < ActiveRecord::Migration
  def change
    create_table :subsites do |t|
      t.string :name
      t.text :description
      t.string :slug

      t.timestamps null: false
    end
    add_index :subsites, :slug, unique: true
  end
end
