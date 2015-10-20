class ProductsController < ApplicationController

  def index
  @products = Product.all
  @cart = @current_user.carts.find_by completed: false
  @tot_quantity = @cart.cart_items.map{|ci| ci.quantity}.sum
  end

  def show
  end
end
