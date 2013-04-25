Twitter.configure do |config|
  twitter_config = Settings.twitter[:api]
  config.consumer_key = twitter_config.consumer_key
  config.consumer_secret = twitter_config.consumer_secret
  config.oauth_token = twitter_config.oauth_token
  config.oauth_token_secret = twitter_config.oauth_token_secret
end