require 'rails_helper'

RSpec.describe IndividualActivity do
  it 'exists and has attributes' do
    info = {"activity":"Learn a new recipe",
          	"accessibility":0.05,
          	"type":"cooking",
          	"participants":1,
          	"price":0}
    activity = IndividualActivity.new(info)

    expect(activity).to be_a(IndividualActivity)
    expect(activity.title).to eq("Learn a new recipe")
    expect(activity.type).to eq("cooking")
    expect(activity.participants).to eq(1)
    expect(activity.price).to eq(0)
  end
end
