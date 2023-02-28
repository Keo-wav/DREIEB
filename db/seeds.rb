# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# kill all existing data
p "Destroying all orders ..."
Order.destroy_all
p "Destroying all drugs ..."
Drug.destroy_all
p "Destroying all users ..."
User.destroy_all

p "Creating users..."

# Create a main sample user.
user = User.new(
  :email                 => "admin@test.com",
  :password              => "123456",
  :password_confirmation => "123456"
)
user.save!

p "Users created!"
p "##################################"
p "Creating drugs..."

drug = Drug.new(
  :name => "Drug 1",
  :price => 100,
  :description => "Description 1",
  :category => "Kétamine",
  :delivery_time => 1,
  :user_id => user.id
)
drug.save!

p "first Drugs created!"

drug = Drug.new(
  :name => "Drug 2",
  :price => 200,
  :description => "Description 2",
  :category => "Cannabis",
  :delivery_time => 2,
  :user_id => user.id
)
drug.save!

p "second Drugs created!"

drug = Drug.new(
  :name => "Drug 3",
  :price => 300,
  :description => "Description 3",
  :category => "LSD",
  :delivery_time => 3,
  :user_id => user.id
)
drug.save!

p "third Drugs created!"

p "##################################"

p "All Drugs created!"

p "Seed finished!"
