require 'rails_helper'

RSpec.describe 'forecast endpoint' do
  it 'returns the forecast for given city,state' do
    get '/api/v1/forecast?location=denver,co'
    forecast = JSON.parse(response.body, symbolize_names: true)
    forecast_data = forecast[:data][:attributes]

    expect(response).to be_successful
    expect(forecast).to be_a(Hash)
    expect(forecast[:data]).to have_key(:id)
    expect(forecast[:data][:id]).to eq(nil)
    expect(forecast[:data]).to have_key(:type)
    expect(forecast[:data][:type]).to eq("forecast")
    expect(forecast[:data]).to have_key(:attributes)
    expect(forecast_data).to be_a(Hash)

    expect(forecast_data).to have_key(:current)
    expect(forecast_data[:current]).to be_a(Hash)
    expect(forecast_data[:current]).to have_key(:datetime)
    expect(forecast_data[:current][:datetime]).to be_a(String)
    expect(forecast_data[:current]).to have_key(:sunrise)
    expect(forecast_data[:current][:sunrise]).to be_a(String)
    expect(forecast_data[:current]).to have_key(:sunset)
    expect(forecast_data[:current][:sunset]).to be_a(String)
    expect(forecast_data[:current]).to have_key(:temp)
    expect(forecast_data[:current][:temp]).to be_a(Float)
    expect(forecast_data[:current]).to have_key(:feels_like)
    expect(forecast_data[:current][:feels_like]).to be_a(Float)
    expect(forecast_data[:current]).to have_key(:humidity)
    expect(forecast_data[:current][:humidity]).to be_a(Integer)
    expect(forecast_data[:current]).to have_key(:uvi)
    expect(forecast_data[:current]).to have_key(:visibility)
    expect(forecast_data[:current][:visibility]).to be_a(Integer)
    expect(forecast_data[:current]).to have_key(:conditions)
    expect(forecast_data[:current][:conditions]).to be_a(String)
    expect(forecast_data[:current]).to have_key(:icon)
    expect(forecast_data[:current][:icon]).to be_a(String)

    expect(forecast_data[:current]).to_not have_key(:pressure)
    expect(forecast_data[:current]).to_not have_key(:dew_point)
    expect(forecast_data[:current]).to_not have_key(:clouds)
    expect(forecast_data[:current]).to_not have_key(:wind_speed)
    expect(forecast_data[:current]).to_not have_key(:wind_deg)
    expect(forecast_data[:current]).to_not have_key(:wind_gust)


    #hourly weather
    expect(forecast_data).to be_a(Hash)
    expect(forecast_data).to have_key(:current)
    expect(forecast_data[:hourly]).to be_a(Array)
    expect(forecast_data[:hourly].first).to be_a(Hash)
    expect(forecast_data[:hourly].first).to have_key(:time)
    expect(forecast_data[:hourly].first[:time]).to be_a(String)
    expect(forecast_data[:hourly].first).to have_key(:temp)
    expect(forecast_data[:hourly].first[:temp]).to be_a(Float)
    expect(forecast_data[:hourly].first).to have_key(:conditions)
    expect(forecast_data[:hourly].first[:conditions]).to be_a(String)
    expect(forecast_data[:hourly].first).to have_key(:icon)
    expect(forecast_data[:hourly].first[:icon]).to be_a(String)

    expect(forecast_data[:hourly].first).to_not have_key(:pressure)
    expect(forecast_data[:hourly].first).to_not have_key(:dew_point)
    expect(forecast_data[:hourly].first).to_not have_key(:clouds)
    expect(forecast_data[:hourly].first).to_not have_key(:wind_speed)
    expect(forecast_data[:hourly].first).to_not have_key(:wind_deg)
    expect(forecast_data[:hourly].first).to_not have_key(:wind_gust)
    expect(forecast_data[:hourly].first).to_not have_key(:feels_like)

    #daily weather

    expect(forecast_data).to be_a(Hash)
    expect(forecast_data).to have_key(:daily)
    expect(forecast_data[:daily]).to be_a(Array)
    expect(forecast_data[:daily].first).to be_a(Hash)
    expect(forecast_data[:daily].first).to have_key(:date)
    expect(forecast_data[:daily].first[:date]).to be_a(String)
    expect(forecast_data[:daily].first).to have_key(:sunrise)
    expect(forecast_data[:daily].first[:sunrise]).to be_a(String)
    expect(forecast_data[:daily].first).to have_key(:sunset)
    expect(forecast_data[:daily].first[:sunset]).to be_a(String)
    expect(forecast_data[:daily].first).to have_key(:max_temp)
    expect(forecast_data[:daily].first[:max_temp]).to be_a(Float)
    expect(forecast_data[:daily].first).to have_key(:min_temp)
    expect(forecast_data[:daily].first[:min_temp]).to be_a(Float)
    expect(forecast_data[:daily].first).to have_key(:conditions)
    expect(forecast_data[:daily].first[:conditions]).to be_a(String)
    expect(forecast_data[:daily].first).to have_key(:icon)
    expect(forecast_data[:daily].first[:icon]).to be_a(String)

    expect(forecast_data[:daily].first).to_not have_key(:pressure)
    expect(forecast_data[:daily].first).to_not have_key(:dew_point)
    expect(forecast_data[:daily].first).to_not have_key(:moonrise)
    expect(forecast_data[:daily].first).to_not have_key(:moonset)
    expect(forecast_data[:daily].first).to_not have_key(:moon_phase)
    expect(forecast_data[:daily].first).to_not have_key(:wind_speed)
    expect(forecast_data[:daily].first).to_not have_key(:wind_deg)
    expect(forecast_data[:daily].first).to_not have_key(:wind_gust)
  end

  it 'renders an error if no city,state' do
    get '/api/v1/forecast?location='

    expect(response).to_not be_successful
    expect(status).to eq(400)
  end
end
