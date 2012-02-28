class NewsFeedService
  
  def self.fetch(news_feed)
    feed = Feedzirra::Feed.fetch_and_parse(news_feed.url)
    feed.entries.each do |entry|
      news = News.new(:url => entry.url, 
                      :entry_id =>entry.entry_id,
                      :categories => entry.categories.join(","),
                      :entry_id => entry.entry_id) 
      news.summary = Sanatize.clean(entry.summary)                     
      news.image_urls = grab_content_image_urls(entry.content)
      news.content = Sanitize.clean(entry.content)
      news_feed.news << news
    end
    news_feed.save
  end
  
  private 
  
  def self.grab_content_image_urls(content)
    doc = Nokogiri::HTML.parse(content)
    doc.xpath("//img/@src").map(&:value).join(",")    
  end
  
end