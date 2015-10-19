class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
        t.integer :cart_id, null: false
        t.integer :product_id, null: false
        t.integer :price_in_cents, null: false
        t.integer :quantity, null: false, default: 1

      t.timestamps null: false
    end
  end
end
