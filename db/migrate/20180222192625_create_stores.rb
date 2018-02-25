class CreateStores < ActiveRecord::Migration[5.1]
  def change
    create_table :stores do |t|
      t.string :title
      t.string :city
      t.string :street
      t.integer :spaces_count, default: 0
      t.timestamps
    end
    add_index :stores, :title, unique: true
    add_index :stores, :city
    add_index :stores, :street
    add_index :stores, :spaces_count
  end
end
