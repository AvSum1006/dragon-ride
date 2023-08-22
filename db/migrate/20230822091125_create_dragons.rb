class CreateDragons < ActiveRecord::Migration[7.0]
  def change
    create_table :dragons do |t|
      t.string :name
      t.string :location
      t.string :category
      t.float :price_per_day
      t.references :user, null: false, foreign_key: true
      t.text :description
      t.integer :seats
      t.integer :age

      t.timestamps
    end
  end
end
