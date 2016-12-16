# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

dinner = Menu.create(name: "Dinner")
lunch = Menu.create(name: "Lunch")
brunch = Menu.create(name: "Brunch")

apps = Category.create(name: "Appetizers")
main = Category.create(name: "Main Courses")
dessert = Category.create(name: "Dessert")
drinks = Category.create(name: "Drinks")

chicken = Item.create(name: "chicken", price: "14.50", description: "tasty")
coke = Item.create(name: "coke", price: "3.50", description: "soda")
lasagna = Item.create(name: "Lasagna", price: "14.50", description: "tasty")
burger = Item.create(name: "BBQ bacon cheeseburger", price: "14.50", description: "cheeseburger with bacon and BBQ sauce")
brownie = Item.create(name: "brownie", price: "6.50", description: "decadent hot fudge brwonie")
filet = Item.create(name: "filet mignon", price: "24.50", description: "pure grade A farm raised beef")
eggs = Item.create(name: "scrambled eggs", price: "14.50", description: "tasty")
