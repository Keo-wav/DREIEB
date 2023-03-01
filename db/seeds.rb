require "open-uri"

photo_keta = URI.open("https://res.cloudinary.com/dlixoduzo/image/upload/v1677662108/keta_fiole_g1m4pj.jpg")
photo_weed = URI.open("https://res.cloudinary.com/dlixoduzo/image/upload/v1677662124/weed_white_widow_wuhvul.webp")
photo_lsd = URI.open("https://res.cloudinary.com/dlixoduzo/image/upload/v1677662117/lsd_panoramix_tz6mng.webp")

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
buyer = User.new(
  :email                 => "buyer@test.com",
  :password              => "123456",
  :password_confirmation => "123456",
  :role                  => "buyer",
  :username              => "buyer_TCy"
)
buyer.save!

p "buyer created!"

seller = User.new(
  :email                 => "seller@test.com",
  :password              => "123456",
  :password_confirmation => "123456",
  :role                  => "seller",
  :username              => "seller_kekou"
)
seller.save!

p "seller created!"

admin = User.new(
  :email                 => "admin@test.com",
  :password              => "123456",
  :password_confirmation => "123456",
  :role                  => "admin",
  :username              => "admin_root"
)
admin.save!

p seller.id

p "admin created!"

p "Users created!"
p "##################################"
p "Creating drugs..."

drug_WC = Drug.new(
  :name => "White Crystal",
  :price => 100,
  :description => "Miam miam",
  :category => "Kétamine",
  :delivery_time => 1,
  :user_id => seller.id
)
drug_WC.photo.attach(io: photo_keta, filename: 'keta_fiole_g1m4pj.jpg', content_type: 'image/jpg')
drug_WC.save!

p "first Drugs created!"

drug_WW = Drug.new(
  :name => "White Widow",
  :price => 200,
  :description => "Fume à fond, fume fume à fond : Ouais ya du monde au balcon",
  :category => "Cannabis",
  :delivery_time => 2,
  :user_id => seller.id
)
drug_WW.photo.attach(io: photo_weed, filename: 'weed_white_widow_wuhvul.webp', content_type: 'image/webp')
drug_WW.save!

p "second Drugs created!"

drug_LSD = Drug.new(
  :name => "LSD 125u Panoramix Double",
  :price => 300,
  :description => "T'es prêt pour un trip de malade ?",
  :category => "LSD",
  :delivery_time => 3,
  :user_id => admin.id
)
drug_LSD.photo.attach(io: photo_lsd, filename: 'lsd_panoramix_tz6mng.webp', content_type: 'image/webp')
drug_LSD.save!

p "third Drugs created!"

p "##################################"

p "All Drugs created!"

p "Seed finished!"
