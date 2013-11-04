# heroku config:add FACEBOOK_KEY=99999
# heroku config:add FACEBOOK_SECRET=99999

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'],
           :scope => 'email,user_birthday,read_stream', :display => 'popup'
end
