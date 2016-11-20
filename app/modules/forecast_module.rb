module ForecastModule
  def self.get_temperature_from_location(api_key, lat, long, units)
    response = HttpModule.get('api.darksky.net', "/forecast/#{api_key}/#{lat},#{long}?units=#{units}")
    forecast = ::JSON.parse(response.body)
    forecast['currently']['temperature'].round
  end
end
