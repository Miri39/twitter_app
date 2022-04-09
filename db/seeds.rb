# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create(
    name: "John",
    email: "gmail.com",
    age: 22,
    gender: "Male"
)

User.create(
    name: "Alexandra",
    email: "cevagmail.com",
    age: 25,
    gender: "Female"
)
User.create(
    name: "Mike",
    email: "altcevagmail.com",
    age: 18,
    gender: "Male"
)
User.create(
    name: "Ioana",
    email: "Anagmail.com",
    age: 19,
    gender: "Female"
)
User.create(
    name: "Andrei",
    email: "whatgmail.com",
    age: 17,
    gender: "Other"
)