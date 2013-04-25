class Tweet < ActiveRecord::Base
  attr_accessible :text, :tweet_id, :created_at
  has_one :favorite
end
