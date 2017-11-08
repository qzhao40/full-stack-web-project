# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

Product.delete_all
Product.create! id: 1, name: "Brembo Break Kit", description: "Performance break plates and pads. Price shown for single item", price: 1799.99, active: true
Product.create! id: 2, name: "BBS Rims", description: "The lightest forged rims. Price shown for single item", price: 1999.99, active: true
Product.create! id: 3, name: "KYB Unscrewing shock absorbers", description: "36 gears adjustable suspension. Price shown for single item", price: 1999.99, active: true
Product.create! id: 4, name: "Test", description: "Test delete and edit function", price: 0.01, active: true
Product.create! id: 5, name: "HonyWell Turbo&Turbo charger", description: "Performace racing turbo", price: 6499.99, active: true
Product.create! id: 6, name: "FGK Exhaust(header)", description: "Performace racing exhaust", price: 899.99, active: true
Product.create! id: 7, name: "FGK Exhaust(middle)", description: "Performace racing exhaust", price: 699.99, active: true
Product.create! id: 8, name: "FGK Exhaust(tail)", description: "Performace racing exhaust", price: 799.99, active: true
Product.create! id: 9, name: "AC Spoiler", description: "Stable and racing spoiler", price: 1399.99, active: true
Product.create! id: 10, name: "BOSCH headlights", description: "Fancy headlights", price: 999.99, active: true
Product.create! id: 11, name: "Goodyear racing tires", description: "A must for racing and drifting. Price shown for single item", price: 1099.99, active: true

OrderStatus.delete_all
OrderStatus.create! id: 1, name: "In Progress"
OrderStatus.create! id: 2, name: "Placed"
OrderStatus.create! id: 3, name: "Shipped"
OrderStatus.create! id: 4, name: "Cancelled"
