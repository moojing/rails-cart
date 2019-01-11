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

20.times do |i|
    Product.create!(
        :sku => Faker::Number.number(2) ,
        :name => Faker::Creature::Cat.breed,
        :content => Faker::Movies::StarWars.quote ,
        :price => Faker::Number.number(3) ,
        :stock => Faker::Number.number(2),
        :enable => 1) 
end


5.times do 
    Category.create!(
        :name=>Faker::Coffee.variety,
        :kind=>0
    )
end 