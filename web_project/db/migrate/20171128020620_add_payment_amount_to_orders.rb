class AddPaymentAmountToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :payment_amount, :string
  end
end