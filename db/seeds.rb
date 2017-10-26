# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.fir,st)
Fridge.destroy_all

trey_fridge = Fridge.create(location:"Kitchen", brand:"GE", size:60, has_food:false, has_drink:true)
sarah_fridge = Fridge.create(location:"Garage", brand:"LG", size:60, has_food:false, has_drink:true)

Food.create(fridge_id: trey_fridge.id, name: "Cheese", weight: 10, vegan: false, placed_in_fridge: Date.today)
Food.create(fridge_id: sarah_fridge.id, name: "pizza", weight: 5, vegan: true, placed_in_fridge: Date.today)

Drink.create(fridge_id: trey_fridge.id, name: "beers3", size: 100, is_alcoholic: true)
Drink.create(fridge_id: sarah_fridge.id, name: "apple juice", size: 50, is_alcoholic: false)