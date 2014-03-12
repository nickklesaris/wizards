require 'sinatra'
require 'csv'
require_relative 'posting'
require 'pry'

get '/' do
  erb :index
end

post '/articles' do
#read the input from the form the user filled out
#wizard_input = [{:title => 'title', :url => 'url_addr', :desc => 'description'}]
# Open archive file and append input from form
#  wizards = []
  @full_article = Posting.new(params["title"],params["url"],params["desc"])


#  wizards << article_hash

#  binding.pry
  CSV.open("postings.csv", 'a') do |file|
    #binding.pry
    file << [@full_article.title, @full_article.url, @full_article.description]
  end

   redirect '/'
end

get '/archive' do
  erb :archive
end
