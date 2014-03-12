require 'sinatra'
require 'csv'
require_relative 'posting'
require 'pry'

get '/' do
  erb :index
end

post '/articles' do

  @posting = Posting.new(params["title"],params["url"],params["desc"])

  if !FileTest.exists?("postings.csv")
    CSV.open("postings.csv", 'w+') do |file|
      file << ["title", "url", "description"]
    end
  end

  CSV.open("postings.csv", 'a') do |file|
    file << [@posting.title, @posting.url, @posting.description]
  end
  redirect '/'
end

get '/archive' do
  @postings = []
  CSV.foreach('postings.csv', headers: true ) do |csv|
    @postings << Posting.new(csv["title"], csv["url"], csv["description"])
  end
erb :archive
end
