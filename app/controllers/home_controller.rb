class HomeController < ApplicationController
  def index
  	@stories = StoryService.new(params).fetch
  end

  def search
  	@stories = StoryService.new(params).fetch
  end
end
