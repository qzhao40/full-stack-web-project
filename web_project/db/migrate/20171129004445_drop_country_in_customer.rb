class DropCountryInCustomer < ActiveRecord::Migration[5.1]
  def change
    remove_column :customers, :country
  end
end
