require 'rails_helper'

RSpec.describe ActivityFacade do
  it 'gets info from activiy service and creates activies object' do
    location = "Denver, CO"
    lat = 39.738453
    lon = -104.984853

    relaxation = {
    	"activity": "Take a bubble bath",
    	"accessibility": 0.1,
    	"type": "relaxation",
    	"participants": 1,
    	"price": 0.15}



    activities = ActivityFacade.create_activities("busywork", location, lat, lon)

    expect(activities).to be_a(Activities)
  end
end
