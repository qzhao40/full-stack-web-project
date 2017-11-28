class SigninController < ApplicationController
  def signin

  end
  def signin_process
    email = params[:email]
    password = params[:password]
    customer = Customer.where(:email => email).where(:password => password).first
   if customer != nil
     session[:customer_info] = Hash.new
     session[:customer_info][:name] = customer.name
     session[:customer_info][:email] = email
     session[:customer_info][:address] = customer.address
     session[:customer_info][:location_id] = customer.location_id
     session[:customer_info][:postcode] = customer.postalCode
     session[:customer_info][:exist] = "yes"
     redirect_to "/checkout/checkout"
   else
     @error_message = "No customer found. Please try again."
   end
  end
end
