class Forecast
  attr_reader :current, :hourly, :daily

  def initialize(info)
    @current = CurrentWeather.new(info)
    @hourly = info[:hourly][0..7].map do |hour|
                HourlyWeather.new(hour)
              end
    @daily = info[:daily][0..4].map do |day|
                DailyWeather.new(day)
              end
  end
end
