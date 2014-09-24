# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

john = User.create!( {:email => "blaghblagh@Zmail.com"})
kenny = User.create!( {:email => "blaghblagh@Zahoo.com"})
sam = User.create!( {:email => "blaghblagh@Zotmail.com"})


ShortenedUrl::create_for_user_and_long_url!( john, "safsaffdsfadfaf")
ShortenedUrl::create_for_user_and_long_url!( john, "11111")
ShortenedUrl::create_for_user_and_long_url!( john, "sa325dsfadfaf")
ShortenedUrl::create_for_user_and_long_url!( john, "saewrffdsfadfaf")
ShortenedUrl::create_for_user_and_long_url!( john, "safsersfadfaf")
ShortenedUrl::create_for_user_and_long_url!( john, "safsawersfadfaf")

ShortenedUrl::create_for_user_and_long_url!( kenny, "safsaffdsfadfaf")
ShortenedUrl::create_for_user_and_long_url!( kenny, "11111")
ShortenedUrl::create_for_user_and_long_url!( kenny, "sa325dsfadfaf")
ShortenedUrl::create_for_user_and_long_url!( kenny, "saewrffdsfadfaf")
ShortenedUrl::create_for_user_and_long_url!( kenny, "safsersfadfaf")
ShortenedUrl::create_for_user_and_long_url!( kenny, "safsawersfadfaf")

to_be_visited = ShortenedUrl::create_for_user_and_long_url!( sam, "xxxxxxx")

Visit.create!(visitor_id: john.id, url_id: to_be_visited.id)
Visit.create!(visitor_id: john.id, url_id: to_be_visited.id)
Visit.create!(visitor_id: kenny.id, url_id: to_be_visited.id)
Visit.create!(visitor_id: kenny.id, url_id: to_be_visited.id)
