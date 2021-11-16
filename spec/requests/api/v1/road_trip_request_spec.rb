require 'rails_helper'

RSpec.describe 'post road trip' do
  it 'returns the road trip' do
    user = User.create!(email: "email@email.com", password: "test", password_confirmation: "test")
    body = {api_key: user.api_key, origin: "Chicago, IL", destination: "Denver, CO"}
    post '/api/v1/roadtrip', params: body

    roadtrip = JSON.parse(response.body, symbolize_names: true)
    roadtrip_data = roadtrip[:data][:attributes]

    expect(response).to be_successful
    expect(roadtrip).to be_a(Hash)
    expect(roadtrip[:data]).to have_key(:id)
    expect(roadtrip[:data][:id]).to eq(nil)
    expect(roadtrip[:data]).to have_key(:type)
    expect(roadtrip[:data][:type]).to eq("roadtrip")
    expect(roadtrip[:data]).to have_key(:attributes)
    expect(roadtrip_data).to be_a(Hash)
    expect(roadtrip_data).to have_key(:start_city)
    expect(roadtrip_data[:start_city]).to be_a(String)
    expect(roadtrip_data).to have_key(:end_city)
    expect(roadtrip_data[:end_city]).to be_a(String)
    expect(roadtrip_data).to have_key(:travel_time)
    expect(roadtrip_data[:travel_time]).to be_a(String)
    expect(roadtrip_data).to have_key(:weather_at_eta)
    expect(roadtrip_data[:weather_at_eta]).to be_a(Hash)
    expect(roadtrip_data[:weather_at_eta]).to have_key(:temperature)
    expect(roadtrip_data[:weather_at_eta][:temperature]).to be_a(Float)
    expect(roadtrip_data[:weather_at_eta]).to have_key(:conditions)
    expect(roadtrip_data[:weather_at_eta][:conditions]).to be_a(String)
  end

  it 'renders animpossible road trip road trip' do
    user = User.create!(email: "email@email.com", password: "test", password_confirmation: "test")
    body = {api_key: user.api_key, origin: "Chicago, IL", destination: "Valencia, Spain"}
    post '/api/v1/roadtrip', params: body

    roadtrip = JSON.parse(response.body, symbolize_names: true)
    roadtrip_data = roadtrip[:data][:attributes]


    expect(response).to be_successful
    expect(roadtrip).to be_a(Hash)
    expect(roadtrip[:data]).to have_key(:id)
    expect(roadtrip[:data][:id]).to eq(nil)
    expect(roadtrip[:data]).to have_key(:type)
    expect(roadtrip[:data][:type]).to eq("roadtrip")
    expect(roadtrip[:data]).to have_key(:attributes)
    expect(roadtrip_data).to be_a(Hash)
    expect(roadtrip_data).to have_key(:start_city)
    expect(roadtrip_data[:start_city]).to be_a(String)
    expect(roadtrip_data).to have_key(:end_city)
    expect(roadtrip_data[:end_city]).to be_a(String)
    expect(roadtrip_data).to have_key(:travel_time)
    expect(roadtrip_data[:travel_time]).to eq("impossible route")
  end

  it 'renders an error if no api_key' do
    user = User.create!(email: "email@email.com", password: "test", password_confirmation: "test")
    body = {origin: "Chicago, IL", destination: "Denver, CO"}
    post '/api/v1/roadtrip', params: body

    expect(response).to_not be_successful
    expect(status).to eq(401)
  end

  it 'renders an error if no origin' do
    user = User.create!(email: "email@email.com", password: "test", password_confirmation: "test")
    body = {api_key: user.api_key, destination: "Valencia, Spain"}
    post '/api/v1/roadtrip', params: body

    expect(response).to_not be_successful
    expect(status).to eq(400)
  end

  it 'renders an error if no destination' do
    user = User.create!(email: "email@email.com", password: "test", password_confirmation: "test")
    body = {api_key: user.api_key, origin: "Valencia, Spain"}
    post '/api/v1/roadtrip', params: body

    expect(response).to_not be_successful
    expect(status).to eq(400)
  end
end
