class AddNewsFeedIdToNews < ActiveRecord::Migration
  def change
    add_column :news, :news_feed_id, :long
  end
end
