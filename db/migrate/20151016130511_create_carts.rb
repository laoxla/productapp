class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.integer :user_id, null: false
      t.boolean :delivery, defaults: false
      t.integer  "price"
      t.string   "permalink"
      t.string   "name"
      t.boolean  "completed",  default: false

      t.timestamps null: false
    end
  end
end
