Payola.configure do |config|

   config.secret_key = 'sk_test_YX4xIKvnQQ3GXlEcg49uCBa6'
   config.publishable_key = 'pk_test_G0XGFDEAx6HWBY3FikrmhRrj'

  # Example subscription:
  #
  config.subscribe 'payola.cart.sale.finished' do |sale|
    cart = sale.product
    cart.update(completed: true)
  end
  #
  # In addition to any event that Stripe sends, you can subscribe
  # to the following special payola events:
  #
  #  - payola.<sellable class>.sale.finished
  #  - payola.<sellable class>.sale.refunded
  #  - payola.<sellable class>.sale.failed
  #
  # These events consume a Payola::Sale, not a Stripe::Event
  #
  # Example charge verifier:
  #
  # config.charge_verifier = lambda do |sale|
  #   raise "Nope!" if sale.email.includes?('yahoo.com')
  # end

  # Keep this subscription unless you want to disable refund handling
  config.subscribe 'charge.refunded' do |event|
    sale = Payola::Sale.find_by(stripe_id: event.data.object.id)
    sale.refund!
  end
end
