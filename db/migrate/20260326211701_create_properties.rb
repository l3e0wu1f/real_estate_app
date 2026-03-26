class CreateProperties < ActiveRecord::Migration[8.1]
  def change
    create_table :properties do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.integer :bedrooms
      t.integer :bathrooms
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :status

      t.timestamps
    end
  end
end
