class CreateSpaces < ActiveRecord::Migration[5.1]
  def change
    create_table :spaces do |t|
      t.references :store, index: true, foreign_key: true
      t.string :title
      t.float :size, default: 0
      t.float :price_per_day, default: 0
      t.float :price_per_week, default: 0
      t.float :price_per_month, default: 0
      t.timestamps
    end
    add_index :spaces, :title, unique: true
  end
end
