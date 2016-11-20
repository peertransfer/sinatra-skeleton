# coding: utf-8
require 'sinatra'
require 'sinatra/config_file'

register Sinatra::ConfigFile
config_file 'config/app_config.yml'

get '/' do
  # GET CURRENT LOCATION
  if defined?(request.location)
    redirect to("/#{request.location.city}")
  else
    redirect to("/#{settings.forecast_default_city}")
  end
end

get '/:location' do
  location_requested = params['location']
  metric_system_requested = params[:metric_system]

  unless (metric_system_requested == '') || (settings.forecast_available_metric_systems.include? metric_system_requested)
    metric_system_requested = settings.forecast_default_metric_system
  end

  metric_symbol = settings.forecast_metric_system_symbol[metric_system_requested]

  location = GoogleMapsModule.get_location_from_address(location_requested)
  forecast_current_temp = ForecastModule.get_temperature_from_location(
    settings.forecast_api_key, location['lat'],
    location['lng'], metric_system_requested
  )

  @location = location_requested
  @temperature = forecast_current_temp
  @metric_system = metric_symbol
  erb :index
end
