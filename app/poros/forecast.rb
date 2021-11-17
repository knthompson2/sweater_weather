class Forecast
  attr_reader :id, :current, :hourly, :daily

  def initialize(info)
    @id = nil
    @current = CurrentWeather.new(info)
    @hourly = create_hourly(info)
    @daily = create_daily(info)
  end

  def create_hourly(info)
    info[:hourly][0..7].map do |hour|
      HourlyWeather.new(hour)
    end
  end

  def create_daily(info)
    info[:daily][0..4].map do |day|
      DailyWeather.new(day)
    end
  end
end
