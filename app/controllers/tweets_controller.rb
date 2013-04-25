class TweetsController < ApplicationController

  before_filter :set_metadata, only: [:index, :favorites]

  def index
    @tweets = Twitter.user_timeline(Settings.twitter[:watch_user])
  end

  def favorites
    @tweets = Twitter.statuses(Favorite.pluck(:tweet_id))
  end

  def fetch
    @tweets = Twitter.user_timeline(Settings.twitter[:watch_user], params)
    result = @tweets.map do |tweet|
      next if tweet.id == params[:max_id].to_i
      next if tweet.id == params[:since_id].to_i
      render_to_string(:partial => "tweets/tweet", :layout => false, :locals => {:tweet => tweet})
    end
    return render(text: result.join)
  end

  def toggle_favorite
    Favorite.toggle(params[:tweet_id])
    return render json: {status: 'ok'}
  end

private
  def set_metadata
    @metadata = Twitter.user(Settings.twitter[:watch_user])
  end
end
