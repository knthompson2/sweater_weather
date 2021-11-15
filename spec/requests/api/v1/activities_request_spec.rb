require 'rails_helper'

RSpec.describe 'activities endpoint' do
  it 'returns an error for no location' do
      get '/api/v1/activities?destination='

      expect(response).to_not be_successful
  end
  it 'returns an activities hash for cold city' do
    get '/api/v1/activities?destination=chicago,il'
    activities = JSON.parse(response.body, symbolize_names: true)
    activities_data = activities[:data][:attributes]

    expect(response).to be_successful
    expect(activities).to have_key(:data)
    expect(activities).to be_a(Hash)
    expect(activities[:data]).to have_key(:id)
    expect(activities[:data][:id]).to eq(nil)
    expect(activities[:data]).to have_key(:type)
    expect(activities[:data][:type]).to eq("activities")
    expect(activities[:data]).to have_key(:attributes)
    expect(activities[:data][:attributes]).to be_a(Hash)
    expect(activities_data).to have_key(:destination)
    expect(activities_data).to have_key(:forecast)
    expect(activities_data).to have_key(:activities)
    expect(activities_data[:activities][0][:type]).to eq("cooking")
  end

  it 'returns an activities hash for hot city' do
    get '/api/v1/activities?destination=phoenix,az'
    activities = JSON.parse(response.body, symbolize_names: true)
    activities_data = activities[:data][:attributes]

    expect(response).to be_successful
    expect(activities).to have_key(:data)
    expect(activities).to be_a(Hash)
    expect(activities[:data]).to have_key(:id)
    expect(activities[:data][:id]).to eq(nil)
    expect(activities[:data]).to have_key(:type)
    expect(activities[:data][:type]).to eq("activities")
    expect(activities[:data]).to have_key(:attributes)
    expect(activities[:data][:attributes]).to be_a(Hash)
    expect(activities_data).to have_key(:destination)
    expect(activities_data).to have_key(:forecast)
    expect(activities_data).to have_key(:activities)
    expect(activities_data[:activities][0][:type]).to eq("recreational")
  end

  #still need to test 50-60 degree activity, but ran out of time to stub the data and too much temp variation
  
end
