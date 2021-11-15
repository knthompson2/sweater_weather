require 'rails_helper'

RSpec.describe ImageFacade do
  it 'retrieves data from service and creates new image' do
    image = ImageFacade.get_image_info("Denver")

    expect(image).to be_a(Image)
  end
end
