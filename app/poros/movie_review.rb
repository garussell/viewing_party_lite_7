class MovieReview
  attr_reader :author, 
              :content,
              :id

  def initialize(attributes)
    @author = attributes[:author]
    @content = attributes[:content]
    @id = attributes[:id]
  end
end