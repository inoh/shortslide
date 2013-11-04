# heroku config:add PUSHER_APP_ID=99999
# heroku config:add PUSHER_KEY=99999
# heroku config:add PUSHER_SECRET=99999

Pusher.url = "http://#{ENV['PUSHER_KEY']}:#{ENV['PUSHER_SECRET']}@api.pusherapp.com/apps/#{ENV['PUSHER_APP_ID']}"
