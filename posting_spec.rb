require 'rspec'
require_relative 'posting'

describe Posting do
    it 'captures the title, url, and description of a posting' do
    test_post = Posting.new("This article", "www.here.com", "loved it")
    expect(test_post.title + ' ' + test_post.url + ' ' + test_post.description).to eq("This article www.here.com loved it")
  end
end


