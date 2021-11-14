require 'rails_helper'

RSpec.describe MapquestFacade do
  it 'gets the lat/long of a given location' do
    location = MapquestFacade.get_location("Denver, CO")

    expect(location).to be_a(Location)
  end
end
