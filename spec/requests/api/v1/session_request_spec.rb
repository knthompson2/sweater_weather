require 'rails_helper'

RSpec.describe 'session request' do
  it 'successfully creates a session' do
    User.create!(email: "pickle@gmail.com", password: "test", password_confirmation: "test")
    body = {email: "pickle@gmail.com", password: "test"}
    post '/api/v1/sessions', params: body

    expect(response).to be_successful
  end

  it 'renders an error for bad credentials' do
    User.create!(email: "pickle@gmail.com", password: "test", password_confirmation: "test")
    body = {email: "pickle@gmail.com", password: "test123"}
    post '/api/v1/sessions', params: body

    expect(response).to_not be_successful
  end

  it 'renders an error for bad credentials/cant find email' do
    User.create!(email: "pickle@gmail.com", password: "test", password_confirmation: "test")
    body = {email: "pepperoni@gmail.com", password: "test123"}
    post '/api/v1/sessions', params: body

    expect(response).to_not be_successful
  end
end
