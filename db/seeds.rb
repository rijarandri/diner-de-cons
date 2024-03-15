# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "faker"
Con.destroy_all

30.times do
  user = User.new(
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
  user.save
end

30.times do
  con = Con.new(
    name: Faker::Name.name,
    price: (1..300).to_a.sample,
    description: "Vraiment très con pour animer vos soirées. Avec lui, vous avez les meilleures chances de gagner!",
    category: ["con de droite", "chroniqueur france inter", "mysogine", "beauf", "supporter de foot", "zadiste", "influenceur", "avocat fiscaliste", "conspirationniste", "Pascal Praud"].sample,
    user_id: (1..30).to_a.sample
  )
  con.save!
end
