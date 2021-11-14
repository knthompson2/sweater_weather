require 'rails_helper'

# RSpec.describe ForecastSerializer do
#   it 'serializes the forecast data' do
#
#     forecast_json = File.read('spec/fixtures/denver_forecast.json')
#
#     forecast_object = Forecast.new(forecast_json)
#     forecast = ForecastSerializer.new(forecast_object)
#     forecast_data = forecast[:data]
#
#     expect(forecast).to be_a(Hash)
#     expect(forecast[:data]).to have_key(:id)
#     expect(forecast[:data][:id]).to eq(nil)
#     expect(forecast[:data]).to have_key(:type)
#     expect(forecast[:data][:type]).to eq("forecast")
#     expect(forecast[:data]).to have_key(:attributes)
#     expect(forecast_data).to be_a(Hash)
#
#     expect(forecast_data).to have_key(:current)
#     expect(forecast_data[:current]).to be_a(Hash)
#     expect(forecast_data[:current]).to have_key(:datetime)
#     expect(forecast_data[:current][:datetime]).to be_a(String)
#     expect(forecast_data[:current]).to have_key(:sunrise)
#     expect(forecast_data[:current][:sunrise]).to be_a(String)
#     expect(forecast_data[:current]).to have_key(:sunset)
#     expect(forecast_data[:current][:sunset]).to be_a(String)
#     expect(forecast_data[:current]).to have_key(:temp)
#     expect(forecast_data[:current][:temp]).to be_a(Float)
#     expect(forecast_data[:current]).to have_key(:feels_like)
#     expect(forecast_data[:current][:feels_like]).to be_a(Float)
#     expect(forecast_data[:current]).to have_key(:humidity)
#     expect(forecast_data[:current][:humidity]).to be_a(Integer)
#     expect(forecast_data[:current]).to have_key(:uvi)
#     expect(forecast_data[:current][:uvi]).to be_a(Float)
#     expect(forecast_data[:current]).to have_key(:visibility)
#     expect(forecast_data[:current][:visibility]).to be_a(Integer)
#     expect(forecast_data[:current]).to have_key(:conditions)
#     expect(forecast_data[:current][:conditions]).to be_a(String)
#     expect(forecast_data[:current]).to have_key(:icon)
#     expect(forecast_data[:current][:icon]).to be_a(String)
#
#     #hourly weather
#     expect(forecast_data).to be_a(Hash)
#     expect(forecast_data).to have_key(:current)
#     expect(forecast_data[:hourly]).to be_a(Array)
#     expect(forecast_data[:hourly].first).to be_a(Hash)
#     expect(forecast_data[:hourly].first).to have_key(:time)
#     expect(forecast_data[:hourly].first[:time]).to be_a(String)
#     expect(forecast_data[:hourly].first).to have_key(:temp)
#     expect(forecast_data[:hourly].first[:temp]).to be_a(Float)
#     expect(forecast_data[:hourly].first).to have_key(:conditions)
#     expect(forecast_data[:hourly].first[:conditions]).to be_a(String)
#     expect(forecast_data[:hourly].first).to have_key(:icon)
#     expect(forecast_data[:hourly].first[:icon]).to be_a(String)
#
#     #daily weather
#
#     expect(forecast_data).to be_a(Hash)
#     expect(forecast_data).to have_key(:daily)
#     expect(forecast_data[:daily]).to be_a(Array)
#     expect(forecast_data[:daily].first).to be_a(Hash)
#     expect(forecast_data[:daily].first).to have_key(:date)
#     expect(forecast_data[:daily].first[:date]).to be_a(String)
#     expect(forecast_data[:daily].first).to have_key(:sunrise)
#     expect(forecast_data[:daily].first[:sunrise]).to be_a(String)
#     expect(forecast_data[:daily].first).to have_key(:sunset)
#     expect(forecast_data[:daily].first[:sunset]).to be_a(String)
#     expect(forecast_data[:daily].first).to have_key(:max_temp)
#     expect(forecast_data[:daily].first[:max_temp]).to be_a(Float)
#     expect(forecast_data[:daily].first).to have_key(:min_temp)
#     expect(forecast_data[:daily].first[:min_temp]).to be_a(Float)
#     expect(forecast_data[:daily].first).to have_key(:conditions)
#     expect(forecast_data[:daily].first[:conditions]).to be_a(String)
#     expect(forecast_data[:daily].first).to have_key(:icon)
#     expect(forecast_data[:daily].first[:icon]).to be_a(String)
#
#
#   end
# end
