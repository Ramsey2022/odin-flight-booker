class FlightsController < ApplicationController
  before_action :set_flight, only: %i[ show edit update destroy ]

  def index
    @depart_dates = Flight.all.collect(&:departure_date).sort.uniq
    @airports = Airport.all
    return unless params[:origin].present?

    @results = Flight.joins(:origin, :destination).where(origin: { code: params[:origin] }, destination: { code: params[:destination] }).where(departure_date: params[:departure_date])
  end

  private

  def set_flight
    @flight = Flight.find(params[:id])
  end

  def flight_params
    params.require(:flight).permit(:location, :departure_time, :flight_duration, :origin_id, :destination_id)
  end
end
