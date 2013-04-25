class ChangeFavorites < ActiveRecord::Migration
  def up
    change_column :favorites, :tweet_id, :integer, :limit => 8
  end

  def down
    change_column :favorites, :tweet_id, :integer
  end
end
