# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create(
    name: "John",
    email: "john@gmail.com",
    age: 22,
    gender: "Male",
    phone_number: "0753552563"
)

User.create(
    name: "Alexandra",
    email: "ceva@gmail.com",
    age: 25,
    gender: "Female",
    phone_number: "0748144754"
)
User.create(
    name: "Mike",
    email: "altceva@gmail.com",
    age: 18,
    gender: "Male",
    phone_number: "0784387653"
)
User.create(
    name: "Ioana",
    email: "Ana@gmail.com",
    age: 19,
    gender: "Female",
    phone_number: "0769958927"
)
User.create(
    name: "Andrei",
    email: "what@gmail.com",
    age: 17,
    gender: "Other",
    phone_number: "0786224488"
)