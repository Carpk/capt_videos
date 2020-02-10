# Capt'n Videos

A nautical youtube clone that allows members to post thier favorite maritime videos to share with the rest of the community.

Capt'n Videos used AWS s3 service, Carrierwave Direct, Fog, JW Player, Ruby 2.1.1p76, Rails 4.0.4, Bootstrap, Devise, PostgreSQL

## Getting Started

`bundle`

`rake db:create`

`rake db:migrate`

Seeding note: To seed db, you must comment out 'mount_uploader :video_url, VideoUploader' in the Video model (app/models/video.rb), run seed, then uncomment. This allows for the same video to be seeded more than once, otherwise the unique keys would prevent them from being saved in the db.

`rake db:seed`

## Screenshots

While the site is live on [heroku](http://captvideos.herokuapp.com/), these are some additional screenshots.

![landing page](https://raw.githubusercontent.com/Carpk/capt_videos/master/app/assets/images/signed-in.png)

After sign in.

![video page](https://raw.githubusercontent.com/Carpk/capt_videos/master/app/assets/images/upload.png)

Would like to give more options here, maybe in v2.

![video page](https://raw.githubusercontent.com/Carpk/capt_videos/master/app/assets/images/upload-created.png)

After saved to db, user is directed to their dashboard.
