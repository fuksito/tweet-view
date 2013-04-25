module TweetsHelper

  def favorite_class(tweet_id)
    'favorite' if favorite_tweet?(tweet_id)
  end

  def favorite_tweet?(tweet_id)
    @favorite_ids ||= Favorite.pluck(:tweet_id)
    @favorite_ids.include?(tweet_id)
  end
end
