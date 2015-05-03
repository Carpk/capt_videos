# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Seeding note: Comment out 'mount_uploader' in Video model, seed, then uncomment.

user_one = User.create(username: "admin",
                        email: "fake@fake.net",
                        birthdate: "Mon, 25 Mar 1968",
                        password: "password",
                        avatar: "https://s3-us-west-2.amazonaws.com/captinvideos/Becoming_A_Legend.jpg",
                        password_confirmation: "password")

Video.create(user_id: user_one.id,
             title: 'matrix_reloaded',
             image: 'https://s3-us-west-2.amazonaws.com/captinvideos/MATRIX.jpg',
             video_url: 'deb085ac-605a-49ea-8621-457acc2c0ea8/clubbed%2Bto%2Bdeath%2B-%2BMatrix%2Bsoundtrack.mp4')

Video.create(user_id: user_one.id,
             title: 'Lux_Aeterna',
             image: 'https://s3-us-west-2.amazonaws.com/captinvideos/Lux_Aeterna.jpg',
             video_url: '2073ca3d-fd70-4ff5-ae67-b85704faba23/Lux%2BAeterna%2BBy%2BClint%2BMansell.mp4')

Video.create(user_id: user_one.id,
             title: 'Blackheart',
             image: 'https://s3-us-west-2.amazonaws.com/captinvideos/Blackheart2012.jpg',
             video_url: '36a629e4-3494-466b-9ae5-61244cfad4bb/Two%2BSteps%2BFrom%2BHell%2B-%2BBlackheart%2B(Thomas%2BBergersen%2B-%2BEpic%2BDark%2BMelancholic%2BDramatic).mp4')

Video.create(user_id: user_one.id,
             title: 'Becoming_A_Legend',
             image: 'https://s3-us-west-2.amazonaws.com/captinvideos/Becoming_A_Legend.jpg',
             video_url: 'f218a4ec-831b-465d-8949-71322079f06c/John%2BDreamer%2B-%2BBecoming%2BA%2BLegend%2B(Epic%2BDramatic%2BUplifting)%2B(HD).mp4')


65.times do
    User.create(username: Faker::Internet.user_name,
                email: Faker::Internet.email,
                birthdate: "Mon, 25 Mar 1968",
                avatar: Faker::Avatar.image,
                password: "password",
                password_confirmation: "password")
end


group_array = ["Garmin radar", "Viking", "Furuno transducers", "Sunseeker", "Hampton", "Sea Ray",
                "Azimut", "Ocean Alexander"]
groups_set = []
group_array.each do |group|
  groups_set << Group.create(user_id: rand(1..50),
               name: group,
               description: Faker::Lorem.sentence)
end


tag_array = ["Transducer", "GPS", "Fiberglass", "Tuna", "Bait", "Rig",
             "Outboard", "Dolphin", "Teak", "VHF", "GPS", "AIS", "Bass",
             "fishing", "fish finder", "reel", "trawler", "center console",
             "radar", "radio", "outbaord"]
tags_set = []
tag_array.each do |tag|
  tags_set << Tag.create(name: tag)
end


image_array = ["http://i.imgur.com/mWUOPTB.jpg", "http://i.imgur.com/CCajhN9.jpg",
               "http://i.imgur.com/XNYn1kP.jpg", "http://i.imgur.com/cWLmX1g.jpg",
               "http://i.imgur.com/gIT6SeI.jpg", "http://i.imgur.com/7OZgr7X.jpg",
               "http://i.imgur.com/XaVQo09.jpg", "http://i.imgur.com/o2DwNtR.jpg",
               "http://i.imgur.com/BFOeIuk.jpg", "http://i.imgur.com/k7vw9vj.jpg"]

150.times do
  video = Video.create(user_id: rand(1..50),
           title: Faker::Company.catch_phrase,
           image: image_array.sample,
           video_url: 'f218a4ec-831b-465d-8949-71322079f06c/John%2BDreamer%2B-%2BBecoming%2BA%2BLegend%2B(Epic%2BDramatic%2BUplifting)%2B(HD).mp4')
  rand(2..4).times do
    video.tags << tags_set.sample
  end
  rand(1..2).times do
    video.groups << groups_set.sample
  end
end

350.times do
    Rating.create(user_id: rand(1..50),
                video_id: rand(1..150),
                score: rand(2..5))
end

200.times do
    Comment.create(user_id: rand(1..50),
                   video_id: rand(1..150),
                   body: Faker::Lorem.paragraph)
end

50.times do
    Message.create(sender_id: rand(1..50),
                    recipient_id: rand(1..50),
                    body: Faker::Lorem.paragraph)
end
