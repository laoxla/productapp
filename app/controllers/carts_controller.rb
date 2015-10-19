require 'securerandom'
class CartsController < ApplicationController

  before_action :authenticate_user!

  before_action do
    @cart = @current_user.carts.find_by completed: false
    if @cart.blank?
      @cart = Cart.new
      @cart.user = @current_user
      @cart.name = [@current_user.email, Time.now].join("-")
      @cart.permalink = SecureRandom.hex
      @cart.price = 0
      @cart.save!
    end
  end

  def confirmation

    @sale = Payola::Sale.find_by! guid: params[:sale_guid]
    @cart = @sale.product

  end

  def add
    @product = Product.find params[:product_id]

    cart_item = @cart.cart_items.find_by product_id: @product.id
    if cart_item.present?
      cart_item.quantity += 1
      cart_item.save
    else
      CartItem.create cart: @cart, product: @product, price: @product.price
    end
    @cart.price = @cart.cart_items.map{|ci| ci.price_in_cents * ci.quantity}.sum
    @cart.save
    redirect_to shopping_cart_path
  end

  def remove
    @product = Product.find params[:product_id]
    cart_item = @cart.cart_items.find_by(product_id: @product.id)
    cart_item.destroy
    @cart.price = @cart.cart_items.map{|ci| ci.price_in_cents * ci.quantity}.sum
    @cart.save
    redirect_to shopping_cart_path
  end

  def show

  end

end
