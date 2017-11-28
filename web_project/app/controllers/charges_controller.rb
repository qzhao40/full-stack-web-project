class ChargesController < ApplicationController
  def new
  end

  def create
    # Amount in cents
     @amount = (session[:total_price].to_f.round(2) * 100).to_i

     customer = Stripe::Customer.create(
       :email => params[:stripeEmail],
       :source  => params[:stripeToken]
     )

     charge = Stripe::Charge.create(
       :customer    => customer.id,
       :amount      => @amount,
       :description => 'Rails Stripe customer',
       :currency    => 'cad'
     )

     if charge.paid && charge.amount == @amount
       order = Order.find(session[:order_id])
       order.status_id = 2
       order.customer_stripe_id = customer.id
       order.charge_stripe_id = charge.id
       order.payment_amount = charge.amount / 100.0
       order.save
     end
     redirect_to "/placeorder/payment"

    rescue Stripe::CardError => e
     flash[:error] = e.message
     redirect_to new_charge_path
  end
end
