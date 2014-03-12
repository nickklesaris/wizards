class Posting
  attr_reader :title, :url, :description
  def initialize(title,url,desc)
    @title = title
    @url = url
    @description = desc
  end

  def linked_title
    "<a href=" + self.url + ">#{self.title}</a>"
  end

  def foobar
    "foobar"
  end
end
