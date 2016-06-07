class InstructionsController < ApplicationController
  def index
    render json: { instructions: "set environment variables for openweathermap api key, weather units, and weather area search string" }
  end
end
