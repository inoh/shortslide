FACEBOOK_KEY="579580062095815"
FACEBOOK_SECRET="a2004cd5091ced55a9629809204ddccb"

=begin
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'],
           :scope => 'email,user_birthday,read_stream', :display => 'popup'
end
=end
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, FACEBOOK_KEY, FACEBOOK_SECRET,
           :scope => 'email,user_birthday,read_stream', :display => 'popup'
end
