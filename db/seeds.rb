# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users_data = [
  { first_name: "albert", last_name: "einstein", email: "ae@relativity.com" },
  { first_name: "marie", last_name: "curie", email: "mc@radiation.com" },
  { first_name: "issac", last_name: "newton", email: "in@gravity.com" },
  { first_name: "galileo", last_name: "galilei", email: "gg@astronomy.com" },
  { first_name: "shrinivasa", last_name: "ramanujan", email: "sr@mathematics.com" },
  { first_name: "nicola", last_name: "tesla", email: "nt@inventor.com" },
  { first_name: "thomas", last_name: "edison", email: "te@light.com" },

]

users_data.each do |user_data|
  User.create_with(user_data).find_or_create_by(email: user_data[:email])
end
