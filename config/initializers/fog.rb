CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => ENV["S3_KEY"],
    :aws_secret_access_key  => ENV["S3_SECRET"]
  }
  config.fog_directory  = ENV["S3_BUCKET"]
  config.max_file_size             = 35.megabytes # defaults to 5.megabytes

end
