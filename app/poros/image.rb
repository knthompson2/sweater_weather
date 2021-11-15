class Image
  attr_reader :id,
              :description,
              :image_url,
              :photographer_name,
              :photographer_url,
              :website

  def initialize(info)
    @id = nil
    @description = info[:description]
    @image_url = info[:urls][:regular]
    @photographer_name = info[:user][:name]
    @photographer_url = info[:user][:links][:html]
  end
end
