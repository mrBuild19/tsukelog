# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"

CSV.foreach('db/csv/users.csv', headers: true) do |row|
  User.create!(
    name: row['name'],
    email: row["email"],
    password: row["password"],
    password_confirmation: row["password_confirmation"],
    admin: row["admin"]
  )
end

CSV.foreach('db/csv/posts.csv', headers: true) do |row|
  Post.create!(
    user_id: row['user_id'],
    title: row["title"],
    text: row["text"],
    rate: row["rate"]
  )
end