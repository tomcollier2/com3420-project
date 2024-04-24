# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Tutor.where(email:'tutor@email.com').first_or_create(password:'password123', password_confirmation:'password123', forename: 'Example', surname: 'Tutor')
Tutor.where(email:'admin@email.com').first_or_create(password:'password123', password_confirmation:'password123', forename: 'Example', surname: 'Admin', admin: true)
Student.where(email:'student@email.com').first_or_create(password:'password123', password_confirmation:'password123', forename: 'Example', surname: 'Student')

