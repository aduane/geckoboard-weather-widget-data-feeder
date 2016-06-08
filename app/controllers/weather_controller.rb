class WeatherController < ApplicationController
  require 'open-uri'
  def index
    weather_data = JSON.load(open(weather_url))
    @weather = {'item' => [{'text' => weather_html(weather_data)}]}
    render json: @weather
  end

  private

  def weather_url
    "http://api.openweathermap.org/data/2.5/weather?q=#{Rails.application.secrets.weather_search_string}&appid=#{Rails.application.secrets.openweathermap_api_key}&units=#{Rails.application.secrets.units}"
  end

  def weather_icon_url(weather_icon)
    "http://openweathermap.org/img/w/#{weather_icon}.png"
  end

  def weather_html(weather_data)
    description = weather_data['weather'].first['description']
    weather_icon = weather_data['weather'].first['icon']
    temp = weather_data['main']['temp'].to_i
    min_temp = weather_data['main']['temp_min'].to_i
    max_temp = weather_data['main']['temp_max'].to_i
    "<div class='t-size-x72' style='float: left'>#{temp}°</div> <div class='t-size-x30 pull-right'>▴#{max_temp}°</div> <div class='t-size-x30 pull-right'>▾#{min_temp}°</div> <div class='t-size-x36 pull-left'>#{description}</div>"
  end
end
