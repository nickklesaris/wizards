class Posting
  attr_reader :title, :url, :description
  def initialize(title,url,desc)
    @title = title
    @url = url
    @description = desc
  end
end
