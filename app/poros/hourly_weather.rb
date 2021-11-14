class HourlyWeather
  attr_reader :datetime,
              :temp,
              :conditions,
              :icon

  def initialize(info)
      # binding.pry
    @datetime = Time.at(info[:dt])
    @temp = info[:temp]
    @conditions = info[:weather].first[:description]
    @icon = info[:weather].first[:icon]
  end
end
