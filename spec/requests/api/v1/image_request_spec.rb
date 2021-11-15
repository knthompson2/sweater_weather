require 'rails_helper'

RSpec.describe '/api/v1/backgrounds?query=location' do
  it 'returns the image info for given city' do
    get '/api/v1/backgrounds?query=denver'

    image = JSON.parse(response.body, symbolize_names: true)
    image_data = image[:data][:attributes]

    expect(response).to be_successful
    expect(image).to be_a(Hash)
    expect(image[:data]).to have_key(:id)
    expect(image[:data][:id]).to eq(nil)
    expect(image[:data]).to have_key(:type)
    expect(image[:data][:type]).to eq("image")
    expect(image[:data]).to have_key(:attributes)
    expect(image_data).to be_a(Hash)

    expect(image_data).to have_key(:description)
    expect(image_data[:description]).to be_a(String)
    expect(image_data).to have_key(:image_url)
    expect(image_data[:image_url]).to be_a(String)
    expect(image_data).to have_key(:photographer_name)
    expect(image_data[:photographer_name]).to be_a(String)
    expect(image_data).to have_key(:photographer_url)
    expect(image_data[:photographer_url]).to be_a(String)
    expect(image_data).to have_key(:source)
    expect(image_data[:source]).to be_a(String)
  end

  it 'returns an error if no location provided' do
    get '/api/v1/backgrounds?query='

    expect(response).to_not be_successful
    expect(status).to eq(400)
  end
end
