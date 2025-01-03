class BookingsController < ApplicationController
  before_action :set_flight, only: [ :new ]
  before_action :set_booking, only: [ :show ]

  def new
    @booking = Booking.new
    @booking.flights << @flight
    @searched_query = {
      departure_airport: @flight.departure_airport.code,
      arrival_airport: @flight.arrival_airport.code,
      start: @flight.start,
      num_tickets: params[:num_tickets]
    }

    params[:num_tickets].to_i.times { @booking.passengers.build }
  end

  def create
    booking_params_without_flight = booking_params
    @flight = Flight.find(booking_params_without_flight.delete(:flight))
    @booking = Booking.new(booking_params_without_flight)
    @booking.flights << @flight

    if @booking.save
      redirect_to @booking, notice: "Booking added successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  private

  def set_flight
    @flight = Flight.find_by(id: params[:flight])

    unless @flight
      redirect_to flights_path, alert: "Flight not found!"
    end
  end

  def booking_params
    params.expect(booking: [ :num_tickets, :flight, passengers_attributes: [ [ :email, :name ] ] ])
  end

  def set_booking
    @booking = Booking.find_by(id: params[:id])

    if @booking.nil?
      redirect_to root_path, alert: "Booking not found!"
    end
  end
end
