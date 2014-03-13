require 'sinatra'
require 'csv'
require_relative 'posting'

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
  @archive = []
  CSV.foreach('postings.csv', headers: true ) do |csv|
    @archive << Posting.new(csv["title"], csv["url"], csv["description"])
  end
  erb :archive

end
