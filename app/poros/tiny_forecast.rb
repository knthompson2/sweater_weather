class TinyForecast
  attr_reader :temp, :summary

  def initialize(info)
    @temp = "#{info[:current][:temp]}F"
    @summary = info[:current][:weather][0][:description]
  end
end
