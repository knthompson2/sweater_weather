require 'rails_helper'

RSpec.describe Activities do
  it 'exists and has attributes' do
    location = "Denver, CO"
    lat = 39.738453
    lon = -104.984853
    result = {"activity":"Learn a new recipe",
	"accessibility":0.05,
	"type":"cooking",
	"participants":1,
	"price":0}
    relaxation = {
	"activity": "Take a bubble bath",
	"accessibility": 0.1,
	"type": "relaxation",
	"participants": 1,
	"price": 0.15,
}
    activities = Activities.new(result, relaxation, location, lat, lon)

    expect(activities).to be_a(Activities)
    expect(activities.id).to eq(nil)
    expect(activities.destination).to eq("Denver, CO")
    expect(activities.forecast.summary).to be_a(String)
    expect(activities.forecast.temp).to be_a(String)
    expect(activities.activities[0].participants).to eq(1)
    expect(activities.activities[0].price).to eq(0)
    expect(activities.activities[0].title).to eq("Learn a new recipe")
    expect(activities.activities[0].type).to eq("cooking")
    expect(activities.activities[1].participants).to eq(1)
    expect(activities.activities[1].price).to eq(0.15)
    expect(activities.activities[1].title).to eq("Take a bubble bath")
    expect(activities.activities[1].type).to eq("relaxation")

  end
end
