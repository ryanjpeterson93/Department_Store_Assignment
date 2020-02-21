# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'
# 5.times do
#   name = Faker::Commerce.department
#   department = Department.create(name: name)
# end

10.times do |i|
  name = Faker::Commerce.department
  department = Department.create(name: name)
  3.times do |j|
    item = department.items.create(
      name: Faker::Commerce.product_name  
    )
  end
end