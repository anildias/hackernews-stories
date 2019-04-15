# A service class to use algolia api to fetch latest hacker news stories
# if params query is passed it will fetch news from api with query params
# default will fetch latest news

require 'net/http'
class StoryService
	URL = 'https://hn.algolia.com/api/v1/search'

	def initialize(params)
		@query = params[:search]
	end

	def fetch
		path = URI(uri)
		response = Net::HTTP.get(path)
		JSON.parse(response)['hits']
	end

	private

	def uri
		@query.present? ? URL+"?query=#{@query}" : URL
	end
end