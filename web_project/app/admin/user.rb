ActiveAdmin.register User do

  permit_params :name, :email, :first_name, :last_name, :password, :country, :province, :city, :home_address, :postal_code

end
