class AddCustomerIdToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :customer_id, :int
  end
end
