class Image
  attr_reader :id,
              :description,
              :image_url,
              :photographer_name,
              :photographer_url,
              :source

  def initialize(info)
    @id = nil
    @description = info[:description]
    @image_url = info[:urls][:regular]
    @photographer_name = info[:user][:name]
    @photographer_url = info[:user][:links][:html]
    @source = 'https://unsplash.com/'
  end
end
