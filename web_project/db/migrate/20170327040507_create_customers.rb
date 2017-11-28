class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.text :address
      t.string :city
      t.string :country
      t.string :postalCode
      t.string :email
      t.references :location, foreign_key: true

      t.timestamps
    end
  end
end
