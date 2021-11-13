require 'rails_helper'

RSpec.describe MapquestService do
  it 'gets geocode info for a given location' do
    response = MapquestService.get_geocode("Denver, CO")

    expect(response).to be_a(Hash)
    expect(response).to have_key(:results)
    expect(response[:results]).to be_a(Array)
    expect(response[:results].first).to have_key(:locations)
    expect(response[:results].first).to be_a(Hash)
    expect(response[:results].first[:locations].first).to have_key(:latLng)
    expect(response[:results].first[:locations].first).to be_a(Hash)
    expect(response[:results].first[:locations].first[:latLng]).to have_key(:lat)
    expect(response[:results].first[:locations].first[:latLng]).to have_key(:lng)
  end
end
