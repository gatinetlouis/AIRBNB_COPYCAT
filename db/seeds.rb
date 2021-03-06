# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' end, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"
puts "#{User.count} users"
puts "#{Car.count} cars"
puts "#{Rental.count} rentals"
puts "#{Review.count} reviews"

puts "DELETING"
User.destroy_all
Car.destroy_all
Rental.destroy_all
Review.destroy_all
puts "#{User.count} users"
puts "#{Car.count} cars"
puts "#{Rental.count} rentals"
puts "#{Review.count} reviews"

puts "SEEDING"


User.destroy_all
Car.destroy_all
Review.destroy_all
Rental.destroy_all


amandine = User.new(
  username: "mandou13",
  password: "azerty",
  phone_number: "073947594039",
  email: "amandine.legal@me.com")
photo_a = URI.open('https://avatars3.githubusercontent.com/u/58696274?v=4')
amandine.photo.attach(io: photo_a, filename: 'photogithub.png', content_type: 'image/png')
amandine.save

maxence = User.new(
  username: "maxtuninglover",
  password: "azerty",
  phone_number: "073947594039",
  email: "maxence.mdr@me.com")
photo_m = URI.open('https://avatars3.githubusercontent.com/u/58698893?v=4')
maxence.photo.attach(io: photo_m, filename: 'photogithub.png', content_type: 'image/png')
maxence.save

louis = User.new(
  username: "Gatuning",
  password: "azerty",
  phone_number: "073947164039",
  email: "gattuning@me.com")

photo = URI.open('https://avatars2.githubusercontent.com/u/56741514?v=4')
louis.photo.attach(io: photo, filename: "photogithub.png", content_type: 'image/png')
louis.save

User.create(
  username: "dortuning",
  password: "azerty",
  phone_number: "0739893967",
  email: "dortuning@me.com")

pauline = User.new(
  username: "Paopao",
  password: "azerty",
  phone_number: "0642462227",
  email: "pauline@me.com")
photo_p = URI.open("https://avatars1.githubusercontent.com/u/58698738?v=4")
pauline.photo.attach(io: photo_p, filename: "photogithub.png", content_type: "image/png")
pauline.save

user_id = []
User.all.each do |user|
  user_id << user.id
end


first_car = Car.new(
  brand: "Audi",
  model: "Audi A4",
  color: "Purple",
  price_per_day: 134,
  description: "Je vous propose une audi A4 tuning, c'est un modèle unique. Elle a de belles jantes noires, parfait pour un we",
  pick_up_address: "10 Rue Louise de Bettignies, 59133 Phalempin",
  pick_up_city: "Phalempin",
  fuel_type: "Diesel",
  automatic: true,
  neon: true,
  watts:  356,
  rim_size: 450,
  user_id: amandine.id
  )

first_car_photo = URI.open('https://www.tuningblog.eu/fr/wp-content/uploads/2017/10/Audi-A4-Avant-B8-Tuning-Purple-Pink-mattschwarz-Folierung-1.jpg')
first_car.photo.attach(io: first_car_photo, filename: 'audi.png', content_type: 'image/png')
first_car.save


second_car = Car.new(
  brand: "Peugeot",
  model: "Peugeot 207 CC",
  color: "Green Apple",
  price_per_day: 155,
  description: "Je vous propose ma belle titine, elle est pimpée à mort, avec  un super système son",
  pick_up_address: "670 Rue Robelin, 62730 Marck",
  pick_up_city: "Marck",
  fuel_type: "Gasoil",
  automatic: true,
  neon: true,
  watts:  500,
  rim_size: 650,
  user_id: pauline.id
  )

second_car_photo = URI.open("https://www.supercars.net/blog/wp-content/uploads/2016/04/2007_Peugeot_207S20003.jpg")
second_car.photo.attach(io: second_car_photo, filename: 'peugeot.png', content_type: 'image/png')
second_car.save


third_car = Car.new(
  brand: "GMC",
  model: "GMC Sierra",
  color: "Red",
  price_per_day: 220,
  description: "Magnifique GMC Sierra, volant en fourrure,  néon à gogo, vous allez vous régaler ",
  pick_up_address: "78 Rue Mail de Lannoy 10, 59100 Roubaix",
  pick_up_city: "Roubaix",
  fuel_type: "Diesel",
  automatic: false,
  neon: true,
  watts:  356,
  rim_size: 450,
  user_id: maxence.id
  )

third_car_photo = URI.open("https://www.tuningblog.eu/fr/wp-content/uploads/2020/02/GMC-Sierra-2500HD-Tuning-Lift-Kit-18.jpg")
third_car.photo.attach(io: third_car_photo, filename: 'gmc.png', content_type: 'image/png')
third_car.save


fourth_car = Car.new(
  brand: "Mercedes",
  model: "AMG",
  color: "Orange",
  price_per_day: 500,
  description: "Ancien taxi, j'ai retappé ma Merco avec beaucoup d'amour, cuir croco, sono 500db et quelques détails bling bling",
  pick_up_address: "12 Rue Montgrand, 13006 Marseille",
  pick_up_city: "Marseille",
  fuel_type: "Gasoil",
  automatic: false,
  neon: true,
  watts:  500,
  rim_size: 200,
  user_id: amandine.id
  )
fourth_car_photo = URI.open("https://www.tuningblog.eu/fr/wp-content/uploads/2017/11/Orange-Beast-Renntech-Mercedes-AMG-GT-R-Tuning-7.jpg")
fourth_car.photo.attach(io: fourth_car_photo, filename: 'amg.png', content_type: 'image/png')
fourth_car.save

fifth_car = Car.new(
  brand: "Toyoya",
  model: "Toyota Prius",
  color: "Yellow",
  price_per_day: 100,
  description: "Ma super toyota prius pimpée comme jamais, enjoliveur du feu de dieu",
  pick_up_address: "1 rue daumier, 13008 Marseille",
  pick_up_city: "Marseille",
  fuel_type: "Gasoil",
  automatic: true,
  neon: true,
  watts:  500,
  rim_size: 100,
  user_id: louis.id
  )
fifth_car_photo = URI.open("https://www.carscoops.com/wp-content/uploads/2016/05/32758c47-prius-wald-14.jpg")
fifth_car.photo.attach(io: fifth_car_photo, filename: 'prius.png', content_type: 'image/png')
fifth_car.save

car_id = []
Car.all.each do |user|
  car_id << user.id
end


Rental.create(
  car_id: first_car.id,
  user_id: louis.id,
  start_date: '21/01/2020',
  end_date: '23/01/2020',
  )

Rental.create(
  car_id: second_car.id,
  user_id: louis.id,
  start_date: '01/02/2020',
  end_date: '04/02/2020'
  )

Rental.create(
  car_id: third_car.id,
  user_id: louis.id,
  start_date: '8/06/2020',
  end_date: '10/06/2020'
  )

amandine_rental = Rental.new(
  car_id: fifth_car.id,
  user_id: amandine.id,
  start_date: '01/02/2020',
  end_date: '10/02/2020'
  )
amandine_rental.save

pauline_rental = Rental.new(
  car_id: fifth_car.id,
  user_id: pauline.id,
  start_date: '04/01/2020',
  end_date: '5/01/2020'
  )
pauline_rental.save

Rental.create(
  car_id: fifth_car.id,
  user_id: maxence.id,
  start_date: '01/04/2020',
  end_date: '10/04/2020'
  )

rental_id = []
Rental.all.each do |user|
  rental_id << user.id
end

Review.create(
  rental_id: rental_id[0],
  title: "Pb de moteur",
  review_type: "feedback_from_renter",
  message: "La voiture nous a laché au milieu du week-end.. La grosse galère",
  rating: 1
)

Review.create(
  rental_id: rental_id[1],
  title: "feedback_from_owner",
  review_type: "Un locataire très sale",
  message: "Des déchêts plein la voiture....",
  rating: 1
)

Review.create(
  rental_id: rental_id[2],
  title: "Super bolide",
  review_type: "feedback_from_renter",
  message: "Superbe we avec ma fem dans cette belle voiturrr tunaié",
  rating: 5
)

Review.create(
  rental_id: amandine_rental.id,
  title: "Décu du système son mais cool",
  review_type: "feedback_from_renter",
  message: "Le système son était pas ouf, mais les LED relevaient le niveau. Lourd.",
  rating: 3
)

Review.create(
  rental_id: pauline_rental.id,
  title: "Belle découverte",
  review_type: "feedback_from_renter",
  message: "C'était la première fois que je conduisais une telle voiture. Superbe expérience, je recommande!",
  rating: 5
)

puts "#{User.count} users"
puts "#{Car.count} cars"
puts "#{Rental.count} rentals"
puts "#{Review.count} reviews"
