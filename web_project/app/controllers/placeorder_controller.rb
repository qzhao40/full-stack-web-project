class PlaceorderController < ApplicationController
  def placeorder
    if session[:customer_info]["name"] != nil
        name = session[:customer_info]["name"]
    else
        name = session[:customer_info][:name]
    end

    if session[:customer_info]["email"] != nil
        email = session[:customer_info]["email"]
    else
        email = session[:customer_info][:email]
    end

    if session[:customer_info]["address"] != nil
        address = session[:customer_info]["address"]
    else
        address = session[:customer_info][:address]
    end

    if session[:customer_info]["location_id"] != nil
        location_id_temp = session[:customer_info]["location_id"]
    else
       location_id_temp = session[:customer_info][:location_id]
    end
    location_id = location_id_temp

    if session[:customer_info]["postcode"] != nil
        postcode = session[:customer_info]["postcode"]
    else
        postcode = session[:customer_info][:postcode]
    end

    if session[:customer_info]["password"] != nil
        password = session[:customer_info]["password"]
    else
        password = session[:customer_info][:password]
    end

   customer_location = Location.where(:id => location_id).first

   puts name
   puts email
   puts address
   puts location_id

   if session[:customer_info][:exist] == nil && session[:customer_info]["exist"] == nil && Customer.where(:email => email).where(:password => password).first == nil

     new_cust = Customer.new( :name =>  name,
                              :email => email,
                              :address => address,
                              :postalCode => postcode,
                              :password => password
                            )
      new_cust.location = customer_location
      new_cust.save
    else
       new_cust = Customer.where(:email => email).first
       new_cust.name = name
       new_cust.address = address
       new_cust.postalCode = postcode
       new_cust.location = customer_location
       new_cust.save
    end

    init_status = Status.where(:id => 2).first
    tax_rate = Location.find(location_id).tax_rate
    new_order = Order.new(:tax => tax_rate)

    new_order.customer= new_cust
    new_order.status = init_status
    new_order.save
    render :text => new_order.inspect
    puts new_order.inspect
    session[:order_id] = new_order.id
    items_in_cart = session[:items_in_cart]
    items_in_cart.each do |id, quantity|
      new_lineitem = LineItem.new(:quantity => quantity)
      product_item = Product.where(:id => id).first
      price = product_item.price
      new_lineitem.product = product_item
      new_lineitem.order = new_order
      new_lineitem.price = price
      new_lineitem.save


    session[:items_in_cart] = Hash.new


    end

  end
  def my_order

  end
  def payment_accepted

  end
end
