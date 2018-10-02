# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.destroy_all
# Tweet.destroy_all

url="https://www.w3schools.com/howto/img_avatar2.png"
user = User.create :first_name => 'John', :last_name => "Doe", :email => 'john@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret', :username => "bono"
user.remote_photo_url = url
Tweet.create({content: "hello",user_id: 1})

User.create :first_name => 'dave', :last_name => "boy", :email => 'ben@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret', :username => "jamin"
Tweet.create({content: "bonjour",user_id: 2})


# url = "http://static.giantbomb.com/uploads/original/9/99864/2419866-nes_console_set.png"
# article = Article.new(title: 'NES', body: "A great console")
# article.remote_photo_url = url
# article.save
