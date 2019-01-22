# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(email:'admin@gmail.com',password:'123456',password_confirmation:'123456') 
User.create!(email:'user@gmail.com',password:'123456',password_confirmation:'123456')
Coupon.create!(code: 'yes888',expire_at: '2020-01-16 16:43:42 UTC',discount:'200',remain:200)

10.times do |i|
    User.create!(email: Faker::Internet.unique.email,password:'123456',password_confirmation:'123456')
end

category = ['新品上架','限時優惠','熱賣推薦','化妝品','美髮用品','保養品','日用品','獨家產品'] 
8.times do |i| 
    Category.create!(
        :name=>category[i],
        :slug=>category[i],
        :kind=>0
    )
end 


post_category = ['最新消息','選購攻略','常見問題'] 
post_category.each_with_index do |title,index| 
    PostCategory.create!(
        :title=>title,
        :description=>Faker::Lorem.sentence(3, false, 4) 
    )
end 


20.times do |i|
    newproduct = Product.create!(
        :stock => Faker::Number.number(2) ,
        :name => Faker::Creature::Cat.breed,
        :content =>Faker::Lorem.paragraph(20, false, 4) ,
        :price => Faker::Number.number(3) ,
        :sku => Faker::Bank.swift_bic ,
        :enable => 1) 
    newproduct.categories<<Category.find(Faker::Number.between(1,5))
    newpost = Post.create!(
        title: Faker::Lorem.word,
        description: Faker::Lorem.paragraph(10, false, 4),
        pre_description: Faker::Quotes::Shakespeare.king_richard_iii_quote,
        post_category_id: Faker::Number.between(1,3)
         )
     
end


