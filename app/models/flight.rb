class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"

  has_and_belongs_to_many :bookings

  before_validation :set_number

  validates_associated :departure_airport, :arrival_airport
  validates :duration, :start, :number, presence: true

  validates :duration, numericality: { greater_than: 0 }

  # Returns the details for the flight
  def details
    "#{departure_airport.code} ~> #{arrival_airport.code}"
  end

  # Returns the duration of the flight in hours and minutes
  def duration_in_hours
    hours = duration / 3600
    "#{hours}h"
  end

  private

  def set_number
    self.number ||= Faker::Number.unique.number(digits: 10)
  end
end
