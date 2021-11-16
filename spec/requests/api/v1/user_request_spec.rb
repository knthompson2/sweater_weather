require 'rails_helper'

RSpec.describe 'user request' do
  it 'creates a user' do
    body = {email: "pickle@gmail.com", password: "test123", password_confirmation: "test123"}
    post '/api/v1/users', params: body

    expect(response).to be_successful
    user = JSON.parse(response.body, symbolize_names: true)

    expect(user).to be_a(Hash)
    expect(user[:data]).to be_a(Hash)
    expect(user[:data]).to have_key(:id)
    expect(user[:data][:id]).to be_a(String)

    expect(user[:data]).to have_key(:type)
    expect(user[:data][:type]).to eq("user")

    expect(user[:data]).to have_key(:attributes)
    expect(user[:data][:attributes]).to be_a(Hash)
    expect(user[:data][:attributes]).to have_key(:email)
    expect(user[:data][:attributes][:email]).to be_a(String)
    expect(user[:data][:attributes]).to have_key(:api_key)
    expect(user[:data][:attributes][:api_key]).to be_a(String)


  end
end
