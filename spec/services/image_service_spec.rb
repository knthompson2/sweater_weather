require 'rails_helper'

RSpec.describe ImageService do
  it 'gets background image for given location' do
    response = ImageService.get_image("Denver")

    expect(response).to be_a(Hash)
    expect(response).to have_key(:results)
    expect(response[:results]).to be_a(Array)
    expect(response[:results].first).to have_key(:description)
    expect(response[:results].first[:description]).to be_a(String)
    expect(response[:results].first).to have_key(:urls)
    expect(response[:results].first[:urls]).to be_a(Hash)
    expect(response[:results].first[:urls]).to have_key(:regular)
    expect(response[:results].first[:urls][:regular]).to be_a(String)
    expect(response[:results].first).to have_key(:user)
    expect(response[:results].first[:user]).to be_a(Hash)
    expect(response[:results].first[:user]).to have_key(:name)
    expect(response[:results].first[:user][:name]).to be_a(String)
    expect(response[:results].first[:user]).to have_key(:links)
    expect(response[:results].first[:user][:links]).to be_a(Hash)
    expect(response[:results].first[:user][:links]).to have_key(:html)
    expect(response[:results].first[:user][:links][:html]).to be_a(String)
  end
end
