# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(email:'admin@gmail.com',password:'123456',password_confirmation:'123456') 
User.create!(email:'user@gmail.com',password:'123456',password_confirmation:'123456')


10.times do |i|
    User.create!(email:Faker::Internet.unique.email,password:'123456',password_confirmation:'123456')
end

category = ['化妝品','美髮用品','保養品','日用品','獨家產品'] 
5.times do |i| 
    Category.create!(
        :name=>category[i],
        :kind=>0
    )
end 


10.times do |i|
    Product.create!(
        :stock => Faker::Number.number(2) ,
        :name => Faker::Creature::Cat.breed,
        :content => Faker::Movies::StarWars.quote ,
        :price => Faker::Number.number(3) ,
        :sku => Faker::Bank.swift_bic ,
        :enable => 1) 
end

