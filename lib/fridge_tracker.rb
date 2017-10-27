require_relative '../config/environment'
require_relative '../app/models/fridge'
def get_id
    show_fridges
    puts "Please enter the unique number!"
    id = gets.chomp
end

def add_fridge
    puts "Where is this fridge?"
    locations = gets.chomp
    puts "What brand is this fridge?"
    brands = gets.chomp
    puts "how big is this fridge?"
    sizes = gets.chomp
    puts "does this fridge have any food in it? true or false?"
    has_foods = gets.chomp
    puts "does this fridge have any drink in it? true or false?"
    has_drinks = gets.chomp
    puts "Your new #{brands} fridge will be in #{locations} and is #{sizes} cubic feet"
    Fridge.create(location:locations, brand:brands, size:sizes, has_food:has_foods, has_drink:has_drinks)
end


def show_fridges
fridges = Fridge.all
fridges.each do |fridge|
  puts "Your #{fridge.brand} is located in the #{fridge.location}"
  puts "This fridges unique number! #{fridge.id}"
    end
end

def delete_fridge
    puts "which fridge did you want to destroy?"
    id = get_id
    puts "This fridge is gone!"
    Fridge.destroy(id)
end

def veiw_food
    puts "Which fridge did you want to view the food in?"
    id = get_id
    foods = Food.where(fridge_id: id)
    foods.each do |food|
        puts "This fridge has #{food.name} in the amount of #{food.weight} pounds"
    end
end

def add_food
    puts "which fridge did you want to add to?"
    id = get_id
    puts "What is the name of the food?"
    names = gets.chomp
    puts "What is the weight of the food?"
    weights = gets.chomp
    puts "Is this food vegan?? true or false"
    vegans = gets.chomp
    puts "You have added #{names}!"
    Food.create(fridge_id: id, name: names, weight: weights, vegan: vegans)
end

def delete_food
    puts "which fridge did you want to eat from?"
    id = get_id
    foods = Food.where(fridge_id: id)
    foods.each do |food|
        puts "This fridge has #{food.name} in the amount of #{food.weight} pounds and has a unqiue number of #{food.id}"
    end
    puts "Please select the number of the food you wish to enjoy"
    food_id = gets.chomp
    puts "Wasn't that amazing?!"
    Food.destroy(food_id)
end
def view_drink
    puts "Which Fridge did you want to view the drinks from?"
    id = get_id
    drinks = Drink.where(fridge_id: id)
    drinks.each do |drink|
        puts "This fridge has #{drink.name} in the amount of #{drink.size} oz"
    end
end

def add_drink
    puts "which fridge did you want to add to?"
    id = get_id
    puts "What is the name of the drink?"
    names = gets.chomp
    puts "What size in ounces is this?"
    sizes = gets.chomp
    puts "Is this alcohol? true or false"
    is_alcoholics = gets.chomp
    puts "the drink #{names} has been added! "
    Drink.create(name:names, size:sizes, is_alcoholic:is_alcoholics, fridge_id: id)
end

def drink_some
    puts "which fridge did you want to drink from to?"
    id = get_id
    drinks = Fridge.find(id).drinks
    drinks.each do |drink|
        puts "This fridge has #{drink.name} in the amount of #{drink.size} oz and has a unique id of #{drink.id}"
    end
    puts "Please type the unique id of the drink to comsume some of"
    drink_id = gets.chomp.to_i
    puts "How much are you drinking, remember to leave some for others!"
    ounces = gets.chomp.to_i
    this_drink = Drink.find(drink_id)
    ounce = this_drink.size
    math_oz = (ounce - ounces)
    this_drink.update(size: math_oz)
    puts "Gulp gulp you had #{ounces} of the total #{ounce} leaving #{math_oz} ounces left"
end
def drink_all
    puts "which fridge did you want to drink from to?"
    id = get_id
    drinks = Drink.where(fridge_id: id)
    drinks.each do |drink|
        puts "This fridge has #{drink.name} in the amount of #{drink.size} oz and has a unique id of #{drink.id}"
    end
    puts "Please type the unique id of the drink to comsume all of"
    drink_id = gets.chomp
    puts "Gulp gulp"
    Drink.destroy(drink_id)
end

start_string = %q(
 Welcome to the Fridge Tracker
 What would you like to do?   
 0. To see all fridges   
 1. If you want to add a fridge
 2. you want to delete a fridge
 3. If you want to view all the food in a particular fridge
 4. If you want to add a food item
 5. If you want to eat an item
 6. If you want to view the drinks
 7. If you want to add a drink
 8. If you want to drink some of a drink
 9. If you want all of a drink
 Or if you are done type end!
)
puts start_string
user_descision = gets.chomp.to_i

if user_descision == 0
    show_fridges
end

if user_descision == 1
    add_fridge
end

if user_descision == 2 
    delete_fridge
end

if user_descision == 3
    veiw_food
end

if user_descision == 4
    add_food
end

if user_descision == 5
    delete_food
end

if user_descision == 6
    view_drink
end

if user_descision == 7
    add_drink
end

if user_descision == 8
    drink_some
end

if user_descision == 9
    drink_all
end

if user_descision == "end"
    puts "Bye!!"
end


