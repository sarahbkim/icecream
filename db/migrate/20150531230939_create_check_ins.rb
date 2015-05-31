class CreateCheckIns < ActiveRecord::Migration
  def change
    create_table :check_ins do |t|
      t.string :user_id
      t.string :shop_id
      t.string :user_name
      t.timestamps null: false
    end
  end
end
