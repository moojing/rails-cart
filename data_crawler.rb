
require('nokogiri')
require('rest-client') 
require('open-uri')
require('pry')
require('active_record')
require('faker') 

ActiveRecord::Base.establish_connection({
    adapter: 'mysql2',
    encoding: 'utf8',
    database: 'leisure_development',
    username: 'root',
    password: 'toor',
  })

class User < ActiveRecord::Base 
end

class Product < ActiveRecord::Base 
end

class ProductCategory < ActiveRecord::Base 
end


class RubyCrawler 
    BASE_URL = 'https://www.leisurecosmetics.com/index.php'

    def test_db
        binding.pry
        puts 'prud'
    end
    def run  
        
        (1..100).each do |product_id|
            puts "Parsing product id : #{product_id} \n"
            product_url = "#{BASE_URL}?route=product/product&product_id=#{product_id}"
            begin
             
                html = RestClient.get(product_url)
                doc = Nokogiri::HTML(html)
                product_data = parse_page(doc)
                # print   "name:#{product_data[:name]}"
                # print  "price:#{product_data[:price]}"
                # print  "content:#{product_data[:content]}"
                
                new_prod = Product.create!(product_data)
               
                ProductCategory.create(:product_id=>new_prod.id ,:category_id=>Faker::Number.between(1,5))
                 
               
            rescue => exception
                puts "#{exception.message}"
            end
            sleep 0.1
        end
    end

    def parse_page(doc)
        product_name = doc.css('h2.text-primary').first.text()
        .gsub("\n","")
        .gsub("\t","")
        price = doc.css('.price h2').first().text.match(/(\w+)\$([\d,]+)/)[2]
        price_origin  = doc.css('.price .strike').first().text.match(/(\w+)\$([\d,]+)/)[2]
        print("price = #{price }")
        print("price_origin = #{price_origin}")
        discount_value = price_origin.gsub(",","").to_i - price.gsub(",","").to_i
        tab_content = doc.css('.tab-content')
        sku = doc.css('.condition li').first.text
        .gsub("\t","")
        .gsub("\n","").match(/：(\w+)/)[1]

        
        return {
            :name => product_name, 
            :slug => product_name,
            :price => price,
            :content=>tab_content,
            :discount_value=>discount_value, 
            :sku=>sku,
            :stock=> 100 , 
        }
    end 
end 

RubyCrawler.new.run
