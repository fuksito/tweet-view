class Favorite < ActiveRecord::Base
  attr_accessible :tweet_id
  validates_uniqueness_of :tweet_id, :on => :create, :message => "must be unique"
  belongs_to :tweet

  class << self
    def toggle(tweet_id)
      if record = self.find_by_tweet_id(tweet_id)
        record.destroy
      else
        record = self.create(tweet_id: tweet_id)
      end
    end
  end

end
