# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Mountain.destroy_all

Mountain.create!(

    name: 'Kilimanjaro',
    location: 'Tanzania',
    height: 5895,
    deaths: 10,
    climbed: 30000,
    image_url: 'https://www.achieveglobalsafaris.com/wp-content/uploads/2019/09/Mount-Kilimajaro-National-Park-760x450.png'

)


Mountain.create!(

    name: 'Everest',
    location: 'Nepal and China',
    height: 8849,
    deaths: 305,
    climbed: 10184,
    image_url: 'https://lh3.googleusercontent.com/PtRLKsQ4gDT535yyoZIBcYPs8G3zOH9wGff4cmmBzHCDOrdT9nky-QdFX5vZPNo4xgw=s1200'

)

puts "Done Created #{Mountain.count} mountains"
puts Mountain.pluck(:name).join(', ')