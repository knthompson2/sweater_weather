require 'rails_helper'

RSpec.describe MapquestFacade do
  it 'gets the lat/long of a given location' do
    location = MapquestFacade.get_location("Denver, CO")

    expect(location).to be_a(Location)
  end

  it 'gets directions from mapquest service' do
    time = MapquestFacade.get_route_time("Chicago, IL", "Denver, CO")
    expect(time).to be_a(String)
  end
end
