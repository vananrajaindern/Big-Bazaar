# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



#Create some products 
100.times do
  title = Faker::Book.title
  desc= Faker::Lorem.sentence 
  cat = Faker::Book.genre
  price= Faker::Number.decimal(2)
  Product.create(title: title, description: desc, category: cat, price: price)

end

Product.all.each do |p|
  ProductImage.create(product: p)
end

#Create Admin User
for i in (1..2)

  # Create admin user
  email = "admin" + i.to_s + "@demo.com"
  password = "password"
  first_name = "Demo" + i.to_s
  last_name = Faker::Name.last_name
  is_admin = true

  User.create(email: email, password: password, password_confirmation: password,
   role: is_admin, first_name: first_name, last_name: last_name)

end

