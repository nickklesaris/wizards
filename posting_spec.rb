require 'rspec'
require_relative 'posting'

describe Posting do
  it 'captures the title, url, and description of a posting' do
    test_post = Posting.new("This article", "www.here.com", "loved it")
    expect(test_post.title + ' ' + test_post.url + ' ' + test_post.description).to eq("This article www.here.com loved it")
  end

  describe "#initialize" do
    it "sets the title" do
      title = "awesome title"
      posting = Posting.new(title, "asdasdasd", "asdasd")
      expect(posting.title).to eq title
    end

    it "sets the description" do
      descrition = "awesome description"
      posting = Posting.new("title", "asdasdasd", description)
      expect(posting.description).to eq description
    end
  end
end


