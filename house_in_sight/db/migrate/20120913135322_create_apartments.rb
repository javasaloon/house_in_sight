class CreateApartments < ActiveRecord::Migration
  def change
    create_table :apartments do |t|
      t.string :name
      t.text :description
      t.string :image_url
      t.decimal :price

      t.timestamps
    end
  end
end
