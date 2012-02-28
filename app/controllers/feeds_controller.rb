class FeedsController < ApplicationController
  require 'feedzirra'
  
  def index
    feed = Feedzirra::Feed.fetch_and_parse("http://feeds.feedburner.com/PaulDixExplainsNothing")
    
  end
end
