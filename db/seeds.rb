# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user_one = User.create(username: "admin",
                       email: "fake@fake.net",
                       password: "password")

Video.create(user_id: user_one.id,
             title: 'matrix_reloaded',
             image: 'https://s3-us-west-2.amazonaws.com/captinvideos/MATRIX.jpg',
             video_url: 'https://s3-us-west-2.amazonaws.com/captinvideos/clubbed+to+death+-+Matrix+soundtrack.mp4')

Video.create(user_id: user_one.id,
             title: 'Lux_Aeterna',
             image: 'https://s3-us-west-2.amazonaws.com/captinvideos/Lux_Aeterna.jpg',
             video_url: 'https://s3-us-west-2.amazonaws.com/captinvideos/Lux+Aeterna+By+Clint+Mansell.mp4')

Video.create(user_id: user_one.id,
             title: 'Blackheart',
             image: 'https://s3-us-west-2.amazonaws.com/captinvideos/Blackheart2012.jpg',
             video_url: 'https://s3-us-west-2.amazonaws.com/captinvideos/Two+Steps+From+Hell+-+Blackheart+(Thomas+Bergersen+-+Epic+Dark+Melancholic+Dramatic).mp4')

Video.create(user_id: user_one.id,
             title: 'Becoming_A_Legend',
             image: 'https://s3-us-west-2.amazonaws.com/captinvideos/Becoming_A_Legend.jpg',
             video_url: 'https://s3-us-west-2.amazonaws.com/captinvideos/John+Dreamer+-+Becoming+A+Legend+(Epic+Dramatic+Uplifting)+(HD).mp4')
