class CreateIcecreamShops < ActiveRecord::Migration
  def change
    create_table :icecream_shops do |t|
      t.string :name
      t.string :street_address
      t.string :city
      t.string :state
      t.integer :zipcode
      t.timestamps null: false
    end
  end
end
