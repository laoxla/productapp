class AddPayolaFieldToCart < ActiveRecord::Migration
  def change
    add_column :carts, :price, :integer
    add_column :carts, :permalink, :string
    add_column :carts, :name, :string
  end
end
