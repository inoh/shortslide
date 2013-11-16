S3_CREDENTIALS = {
  :bucket => "shortslide_" + Rails.env,
  :access_key_id => ENV['AWS_KEY'],
  :secret_access_key => ENV['AWS_SECRET'],
  :s3_host_name => ENV['AWS_HOST_NAME']
}
