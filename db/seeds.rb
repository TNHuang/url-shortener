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

a = ShortenedUrl::create_for_user_and_long_url!( john, "http://www.fandango.com/")
b = ShortenedUrl::create_for_user_and_long_url!( john, "http://www.imdb.com/")
c = ShortenedUrl::create_for_user_and_long_url!( john, "http://www.aintitcool.com/")
d = ShortenedUrl::create_for_user_and_long_url!( john, "http://thedissolve.com/")
e = ShortenedUrl::create_for_user_and_long_url!( john, "http://www.avclub.com/")
f =ShortenedUrl::create_for_user_and_long_url!( john, "http://badassdigest.com/")

g = ShortenedUrl::create_for_user_and_long_url!( kenny, "http://www.walmart.com/c/kp/milk-frothers")
h = ShortenedUrl::create_for_user_and_long_url!( kenny, "http://www.wikihow.com/Do-a-Foot-Spa-Treatment-(Milk-and-Sugar-Method)")

i = ShortenedUrl::create_for_user_and_long_url!( kenny, "https://soundcloud.com/")
j = ShortenedUrl::create_for_user_and_long_url!( kenny, "http://genius.com/")
ShortenedUrl::create_for_user_and_long_url!( kenny, "safsersfadfaf")
ShortenedUrl::create_for_user_and_long_url!( kenny, "safsawersfadfaf")

to_be_visited = ShortenedUrl::create_for_user_and_long_url!( sam, "xxxxxxx")

Visit.create!(visitor_id: john.id, url_id: to_be_visited.id)
Visit.create!(visitor_id: john.id, url_id: to_be_visited.id)
Visit.create!(visitor_id: kenny.id, url_id: to_be_visited.id)
Visit.create!(visitor_id: kenny.id, url_id: to_be_visited.id)

movie = TagTopic.create!({name: :movie })
music = TagTopic.create!({name: :music })
milf = TagTopic.create!({name: :milf })

Tagging.create!({:tag_id => movie.id, :url_id => a.id})
Tagging.create!({:tag_id => movie.id, :url_id => b.id})
Tagging.create!({:tag_id => movie.id, :url_id => c.id})
Tagging.create!({:tag_id => movie.id, :url_id => d.id})
Tagging.create!({:tag_id => movie.id, :url_id => e.id})
Tagging.create!({:tag_id => movie.id, :url_id => f.id})

Tagging.create!({:tag_id => music.id, :url_id => i.id})
Tagging.create!({:tag_id => music.id, :url_id => j.id})
Tagging.create!({:tag_id => music.id, :url_id => e.id})


Tagging.create!({:tag_id => milf.id, :url_id => g.id})
Tagging.create!({:tag_id => milf.id, :url_id => h.id})