class AddStatusIdToOrders < ActiveRecord::Migration[5.1]
  def change
      add_column :orders, :status_id, :int
  end
end
