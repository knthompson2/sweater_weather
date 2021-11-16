class HourlyWeather
  attr_reader :time,
              :temp,
              :conditions,
              :icon

  def initialize(info)
    @time = Time.at(info[:dt]).strftime("%I:%m %p")
    @temp = info[:temp]
    @conditions = info[:weather].first[:description]
    @icon = info[:weather].first[:icon]
  end
end
