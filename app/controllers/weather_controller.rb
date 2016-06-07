class WeatherController < ApplicationController
  require 'open-uri'
  def index
    weather_data = JSON.load(open(weather_url))
    description = weather_data['weather'].first['description']
    weather_icon = weather_data['weather'].first['icon']
    temp = weather_data['main']['temp'].to_i
    min_temp = weather_data['main']['temp_min']
    max_temp = weather_data['main']['temp_max']
    @weather = {'item' => [{'text' => "<div class='t-size-x72'>#{temp}&deg;</div><div>#{description}</div>"}]}
    render json: @weather
  end

  private

  def weather_url
    "http://api.openweathermap.org/data/2.5/weather?q=#{Rails.application.secrets.weather_search_string}&appid=#{Rails.application.secrets.openweathermap_api_key}&units=#{Rails.application.secrets.units}"
  end

  def weather_icon_url(weather_icon)
    "http://openweathermap.org/img/w/#{weather_icon}.png"
  end
end
