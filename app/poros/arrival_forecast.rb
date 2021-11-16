class ArrivalForecast
  attr_reader :temp, :conditions

  def initialize(info)
    @temp = info[:temp]
    @conditions = info[:weather].first[:description]
  end
end
