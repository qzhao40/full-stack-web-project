class AddChargeStripeIdToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :charge_stripe_id, :string
  end
end
