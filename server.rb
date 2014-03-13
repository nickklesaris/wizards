require 'sinatra'
require 'csv'
require_relative 'posting'

get '/' do
  erb :index
end

post '/articles' do

  @posting = Posting.new(params["title"],params["url"],params["desc"])
  # @posting.write_to_csv

  if !FileTest.exists?("postings.csv")
    CSV.open("postings.csv", 'w+') do |file|
      file << ["title", "url", "description"]
    end
  end

  # Instance method
  CSV.open("postings.csv", 'a') do |file|
    file << [@posting.title, @posting.url, @posting.description]
  end
  redirect '/'
end

get '/archive' do
  # Class method
  # @postings = Posting.read_from_csv
  @archive = []
  CSV.foreach('postings.csv', headers: true ) do |csv|
    @archive << Posting.new(csv["title"], csv["url"], csv["description"])
  end
  erb :archive

end
