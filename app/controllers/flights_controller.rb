# Handles all the logic needed to handle flights for users.
class FlightsController < ApplicationController
  def index
    @flights_count = Flight.count
    @airports = Airport.all.load

    @available_flights = available_flights

    @searched_query = {
      departure_airport: params[:departure_airport],
      arrival_airport: params[:arrival_airport],
      start: params[:start],
      num_tickets: params[:num_tickets]
    }
  end

  private

  # Retrieve all available flights based on the user's search query.
  def available_flights
    # Ensure all required parameters are present.
    unless [
      "start", "num_tickets", "departure_airport", "arrival_airport"
    ].all? { |key| params.key?(key) }
      return
    end

    arrival_airport = Airport.find_by(code: params[:arrival_airport])
    departure_airport = Airport.find_by(code: params[:departure_airport])

    if departure_airport == arrival_airport
      flash.now[:alert] = "Can't use the same airport as destination and arrival!"
    end

    Flight.includes(:departure_airport, :arrival_airport).where(
      departure_airport:,
      arrival_airport:,
      start: params[:start],
    ).load
  end
end
