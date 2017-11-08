ActiveAdmin.register User do
  permit_params :name, :email, :first_name, :last_name, :password, :country, :province, :city, :home_address, :postal_code
  index do
  column :name
  column :email
  column :first_name
  column :last_name
  column :password
  column :country
  end
end
