require "open-uri"

photo_keta = URI.open("https://res.cloudinary.com/dlixoduzo/image/upload/v1677662108/keta_fiole_g1m4pj.jpg")
photo_weed = URI.open("https://res.cloudinary.com/dlixoduzo/image/upload/v1677662124/weed_white_widow_wuhvul.webp")
photo_lsd = URI.open("https://res.cloudinary.com/dlixoduzo/image/upload/v1677662117/lsd_panoramix_tz6mng.webp")
photo_xtc = URI.open("https://res.cloudinary.com/dlixoduzo/image/upload/v1677662121/redbull_xtc_dz04tg.jpg")
photo_hash = URI.open("https://res.cloudinary.com/dlixoduzo/image/upload/v1677662120/Amnesia_3x_hash_xrn5xi.webp")
photo_speed = URI.open("https://res.cloudinary.com/dlixoduzo/image/upload/v1677662119/speed_paste_lc7103.jpg")
photo_hash_dry = URI.open("https://res.cloudinary.com/dlixoduzo/image/upload/v1677662116/hash_dry_v30joe.jpg")
photo_shrooms = URI.open("https://res.cloudinary.com/dlixoduzo/image/upload/v1677662109/magic_mushrooms_sofb7k.jpg")
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
  :description => "Cette kétamine est de très bonne qualité, et vous fera perdre toute notion de temps et d'espace. Elle arrive déjà cristallisée et est prête à être consommée. 100g",
  :category => "Kétamine",
  :delivery_time => 1,
  :user_id => seller.id
)
drug_WC.photo.attach(io: photo_keta, filename: 'keta_fiole_g1m4pj.jpg', content_type: 'image/jpg')
drug_WC.save!

p "first Drugs created!"

drug_WW = Drug.new(
  :name => "White Widow",
  :price => 75,
  :description => "Herbe de qualité, 80% sativa et 20% indiva; 10g",
  :category => "Cannabis",
  :delivery_time => 2,
  :user_id => seller.id
)
drug_WW.photo.attach(io: photo_weed, filename: 'weed_white_widow_wuhvul.webp', content_type: 'image/webp')
drug_WW.save!

p "second Drugs created!"

drug_LSD = Drug.new(
  :name => "LSD 125u",
  :price => 200,
  :description => "Plaquettes de 100 cartons de LSD 125 microns, double face. Recette originale de Hoffman",
  :category => "LSD",
  :delivery_time => 3,
  :user_id => admin.id
)
drug_LSD.photo.attach(io: photo_lsd, filename: 'lsd_panoramix_tz6mng.webp', content_type: 'image/webp')
drug_LSD.save!

p "third Drugs created!"

drug_XTC = Drug.new(
  :name => "XTC 200mg",
  :price => 40,
  :description => "Extasy RedBull 200mg, très forts. Lots de 10",
  :category => "Amphetamine",
  :delivery_time => 4,
  :user_id => admin.id
)
drug_XTC.photo.attach(io: photo_xtc, filename: 'redbull_xtc_dz04tg', content_type: 'image/jpeg')
drug_XTC.save!

p "fourth Drugs created!"

drug_WH = Drug.new(
  :name => "Amnesia Filtered Hash",
  :price => 500,
  :description => "Ce hash est filtré à l'eau froide, et est donc très pur. Il est très fort et vous fera voyager. Prix au kilo",
  :category => "Cannabis",
  :delivery_time => 5,
  :user_id => seller.id
)

drug_WH.photo.attach(io: photo_hash, filename: 'Amnesia_3x_hash_xrn5xi', content_type: 'image/webp')
drug_WH.save!

p "fifth Drugs created!"

drug_S = Drug.new(
  :name => "Speedy Gonzales",
  :price => 130,
  :description => "C'est pas parce qu'on est sur Rails qu'on peut pas aller encore plus vite que le Wagon. Attention à la surdose de cette pâte de speed, pure à 99%. Prix pour 100g",
  :category => "Amphetamine",
  :delivery_time => 2,
  :user_id => seller.id
)

drug_S.photo.attach(io: photo_speed, filename: 'speed_paste_lc7103', content_type: 'image/jpeg')
drug_S.save!

p "sixth Drugs created!"

drug_DRY = Drug.new(
  :name => "Dry Hash Ice",
  :price => 150,
  :description => "Ce hash est très sec, et particulièrement fort. Attendez vous à une bonne vibe sativa. Prix au kilo",
  :category => "Cannabis",
  :delivery_time => 2,
  :user_id => seller.id
)

drug_DRY.photo.attach(io: photo_hash_dry, filename: 'hash_dry_v30joe', content_type: 'image/jpeg')
drug_DRY.save!

p "seventh Drugs created!"

drug_Shr = Drug.new(
  :name => "Shrooms",
  :price => 200,
  :description => "Magic Mushrooms, 100g",
  :category => "Mushroom",
  :delivery_time => 3,
  :user_id => seller.id
)

drug_Shr.photo.attach(io: photo_shrooms, filename: 'magic_mushrooms_sofb7k', content_type: 'image/jpeg')
drug_Shr.save!

p "eighth Drugs created!"


p "##################################"

p "All Drugs created!"


p "##################################"

p "Seed finished!"
