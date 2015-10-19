class Cart < ActiveRecord::Base

  belongs_to :user
  has_many :cart_items
  include Payola::Sellable


  def price_in_dollars
    self.price.to_i / 100.0
  end

  def redirect_path(payola_sale)
    "/confirmation/#{payola_sale.guid}"
  end


end
