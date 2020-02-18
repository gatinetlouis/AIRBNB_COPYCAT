# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' end, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(
  username: "mandou13",
  password: "azerty",
  phone_number: "073947594039",
  email: "amandine.legal@me.com")

User.create(
  username: "maxtuninglover",
  password: "azerty",
  phone_number: "073947594039",
  email: "maxence.mdr@me.com")

User.create(
  username: "Gatuning",
  password: "azerty",
  phone_number: "073947164039",
  email: "gattuning@me.com")

User.create(
  username: "dortuning",
  password: "azerty",
  phone_number: "0739893967",
  email: "dortuning@me.com")

user_id = []
User.all.each do |user|
  user_id << user.id
end


Car.create(
  brand: "Volvo",
  model: "Volvo 850",
  color: "Purple",
  price_per_day: 134,
  description: "Je vous propose une volvo 850 tuning, c'est un modèle unique. Elle a de belles jantes dorées, parfait pour un we",
  pick_up_address: "34 rue de Strasbourg, 59000 Fallempin, France",
  fuel_type: "Diesel",
  automatic: true,
  neon: true,
  watts:  356,
  rim_size: 450,
  user_id: user_id.sample
  )


Car.create(
  brand: "Peugeot",
  model: "Peugeot 207 CC",
  color: "Green Apple",
  price_per_day: 155,
  description: "Je vous propose ma belle titine, elle est pimpée à mort, avec  un super système son",
  pick_up_address: "34 rue du Tuninf, 59080 Hemmes, France",
  fuel_type: "Gasoil",
  automatic: true,
  neon: true,
  watts:  500,
  rim_size: 650,
  user_id: user_id.sample
  )

Car.create(
  brand: "Opel",
  model: "Opel Astra 2.0",
  color: "Yellow",
  price_per_day: 220,
  description: "Magnifique Opel Astra, volant en fourrure,  néon à gogo, vous allez vous régaler ",
  pick_up_address: "55 bd Saint Etienne, 59070 Roubaix, France",
  fuel_type: "Diesel",
  automatic: false,
  neon: true,
  watts:  356,
  rim_size: 450,
  user_id: user_id.sample
  )

Car.create(
  brand: "Mercedes",
  model: "SL 350",
  color: "Orange",
  price_per_day: 500,
  description: "Ancien taxi, j'ai retappé ma Merco avec beaucoup d'amour, cuir croco, sono 500db et quelques détails bling bling",
  pick_up_address: "34 rue de Strasbourg, 59000 Fallempin, France",
  fuel_type: "Gasoil",
  automatic: false,
  neon: true,
  watts:  500,
  rim_size: 200,
  user_id: user_id.sample
  )

car_id = []
Car.all.each do |user|
  car_id << user.id
end


Rental.create(
  car_id: car_id.sample,
  user_id: user_id.sample,
  start_date: '21/01/20',
  end_date: '23/01/20',
  )

Rental.create(
  car_id: car_id.sample,
  user_id: user_id.sample,
  start_date: '25/01/20',
  end_date: '27/01/20'
  )

Rental.create(
  car_id: car_id.sample,
  user_id: user_id.sample,
  start_date: '01/01/20',
  end_date: '04/01/20'
  )

Rental.create(
  car_id: car_id.sample,
  user_id: user_id.sample,
  start_date: '01/02/20',
  end_date: '10/02/20'
  )

rental_id = []
Rental.all.each do |user|
  rental_id << user.id
end

Review.create(
  rental_id: rental_id.sample,
  title: "Super bolide",
  review_type: "feedback_from_renter",
  message: "Superbe we avec ma fem dans cette belle voiturrr tunaié",
  rating: 5
)

Review.create(
  rental_id: rental_id.sample,
  title: "Décu du système son",
  review_type: "feedback_from_renter",
  message: "Le système son était pas ouf, mais les LED relevaient le niveau",
  rating: 3
)

Review.create(
  rental_id: rental_id.sample,
  title: "Pb de moteur",
  review_type: "feedback_from_renter",
  message: "La voiture nous a laché au milieu du week-end.. La grosse galère",
  rating: 1
)

Review.create(
  rental_id: rental_id.sample,
  title: "feedback_from_owner",
  review_type: "Un locataire très sale",
  message: "Des déchêts plein la voiture....",
  rating: 1
)

