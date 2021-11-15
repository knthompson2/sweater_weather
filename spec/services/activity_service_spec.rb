require 'rails_helper'

RSpec.describe ActivityService do
  it 'returns an acitivty based on type' do
    response = ActivityService.get_activity("relaxation")

    expect(response).to be_a(Hash)
    expect(response).to have_key(:activity)
    expect(response[:activity]).to be_a(String)
    expect(response).to have_key(:type)
    expect(response[:type]).to be_a(String)
    expect(response).to have_key(:participants)
    expect(response[:participants]).to be_a(Integer)
    expect(response).to have_key(:price)
    expect(response).to have_key(:link)
    expect(response[:link]).to be_a(String)
    expect(response).to have_key(:key)
    expect(response[:key]).to be_a(String)
    expect(response).to have_key(:accessibility)
  end
end
