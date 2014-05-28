# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.new
user.email = "raghu@example.com"
user.password = "colts123"
user.password_confirmation = "colts123"
user.save

user = User.new
user.email = "roneesh@example.com"
user.password = "lions123"
user.password_confirmation = "lions123"
user.save

puts "There are now #{User.count} users."

photo_hashes = [
  { :caption => "Peyton Manning", :image_url => "http://upload.wikimedia.org/wikipedia/commons/3/30/Peyton_Manning_%28cropped%29.jpg" },
  { :caption => "Drew Brees", :image_url => "http://upload.wikimedia.org/wikipedia/commons/9/98/Drew_Brees_at_Saints_Super_Bowl_parade_2010-02-09.jpg" },
  { :caption => "Aaron Rodgers", :image_url => "http://upload.wikimedia.org/wikipedia/commons/1/1c/Aaron_Rodgers_2008_%28cropped%29.jpg" },
  { :caption => "Cam Newton", :image_url => "http://upload.wikimedia.org/wikipedia/commons/9/95/Cam_Newton_-_Carolina_Panthers.jpg" },
  { :caption => "Matt Stafford", :image_url => "http://upload.wikimedia.org/wikipedia/commons/6/60/Matt_Stafford_2009_cropped.jpg" },
  { :caption => "Andrew Luck", :image_url => "http://upload.wikimedia.org/wikipedia/commons/d/d9/Andrew_Luck_at_2010_Stanford_football_open_house.JPG" },
  { :caption => "Russell Wilson", :image_url => "http://upload.wikimedia.org/wikipedia/commons/f/f3/Russell_Wilson_at_the_2013_Jessie_Vetter_Classic%2C_July_1%2C_2013.jpg" },
  { :caption => "Colin Kaepernick", :image_url => "http://upload.wikimedia.org/wikipedia/commons/1/1b/Colin_Kaepernick_-_San_Francisco_vs_Green_Bay_2012.jpg" },
  { :caption => "Tom Brady", :image_url => "http://upload.wikimedia.org/wikipedia/commons/9/9f/Tom_Brady_2011.JPG" }
]

photo_hashes.each do |photo_hash|
  photo = Photo.new
  photo.caption = photo_hash[:caption]
  photo.image_url = photo_hash[:image_url]

  random_user = User.offset(rand(User.count)).limit(1).first
  photo.user_id = random_user.id
  photo.save
end

puts "There are now #{Photo.count} photos."

raghus_favorites = ["Peyton Manning", "Andrew Luck"]
roneeshes_favorites = ["Matt Stafford", "Tom Brady"]

raghus_favorites.each do |player_name|
  favorite = Favorite.new
  favorite.user_id = User.find_by({ :email => "raghu@example.com" }).id
  favorite.photo_id = Photo.find_by({ :caption => player_name }).id
  favorite.save
end

roneeshes_favorites.each do |player_name|
  favorite = Favorite.new
  favorite.user_id = User.find_by({ :email => "roneesh@example.com" }).id
  favorite.photo_id = Photo.find_by({ :caption => player_name }).id
  favorite.save
end

puts "There are now #{Favorite.count} favorites."

comments = [
  "He's great!",
  "He's okay",
  "Getting better",
  "First pick",
  "Never!"
]

Photo.all.each do |photo|
  comment = Comment.new
  comment.photo_id = photo.id
  comment.content = comments.sample
  random_user = User.offset(rand(User.count)).limit(1).first
  comment.user_id = random_user.id
  comment.save
end

puts "There are now #{Comment.count} comments."
