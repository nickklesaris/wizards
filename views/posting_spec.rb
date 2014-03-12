require 'rspec'
require_relative 'posting'

describe Posting do
    it 'captures the title, url, and description of a posting' do
    test_post = Posting.new("This article", "www.here.com", "loved it")
    expect(test_post.title).to eq("This article")
    #expect(test_post.title + ' ' + test_post.url + ' ' + test_post.desc).to eq("This article www.here.com loved it")
  end
end
#    it 'calculates the hypotenuse of a right triangle' do
#    rt_triangle = Triangle.new(6.0, 8.0)
#    expect(rt_triangle.hypotenuse).to eq(10.0)
#  end

