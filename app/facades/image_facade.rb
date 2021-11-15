class ImageFacade
  class << self
    def get_image_info(city)
      result = ImageService.get_image(city)[:results][0]
      Image.new(result)
    end
  end
end
