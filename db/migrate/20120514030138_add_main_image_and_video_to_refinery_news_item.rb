class AddMainImageAndVideoToRefineryNewsItem < ActiveRecord::Migration
  def change
    add_column :refinery_news_items, :video_url, :string, length: 1000
    add_column :refinery_news_items, :video_poster_frame, :string, length: 1000
  end
end
