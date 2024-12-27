# Create a list of airport codes
airport_codes = %w[ACC SFO NYC KSI LAX ORD ATL DFW DEN SEA MIA BOS LAS PHX IAH]

# Create airports
airport_codes.each { |code| Airport.create!(code: code) }

# Generate flight combinations
flight_combinations = airport_codes.combination(2).to_a + airport_codes.combination(2).map(&:reverse)

# Generate a common start time for at least 10 flights
common_start_time = Faker::Time.between(from: "2012-01-01", to: "2030-12-12", format: :default)
# Select a specific flight combination for the common flights
common_flight_combination = flight_combinations.sample

# Create 1000 flights
1000.times do |i|
  if i < 3
    departure_airport = Airport.find_by(code: common_flight_combination[0])
    arrival_airport = Airport.find_by(code: common_flight_combination[1])
    start_time = common_start_time
  else
    data = flight_combinations.sample
    departure_airport = Airport.find_by(code: data[0])
    arrival_airport = Airport.find_by(code: data[1])
    start_time = Faker::Time.between(from: "2012-01-01", to: "2030-12-12", format: :default)
  end

  Flight.create!(
    departure_airport: departure_airport,
    arrival_airport: arrival_airport,
    duration: [ 3600, 8783, 1200, 5400, 7200, 9600 ].sample,
    start: start_time,
  )
end

puts "Seeding completed!"
