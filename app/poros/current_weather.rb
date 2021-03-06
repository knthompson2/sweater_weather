class CurrentWeather
  attr_reader :datetime,
              :sunrise,
              :sunset,
              :temp,
              :feels_like,
              :humidity,
              :uvi,
              :visibility,
              :conditions,
              :icon

  def initialize(info)
    @datetime =  Time.at(info[:current][:dt])
    @sunrise = Time.at(info[:current][:sunrise])
    @sunset = Time.at(info[:current][:sunset])
    @temp = info[:current][:temp]
    @feels_like = info[:current][:feels_like]
    @humidity = info[:current][:humidity]
    @uvi = info[:current][:uvi]
    @visibility = info[:current][:visibility]
    @conditions = info[:current][:weather].first[:description]
    @icon = info[:current][:weather].first[:icon]
  end
end
