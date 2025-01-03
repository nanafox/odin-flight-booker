class CreateJoinTableFlightBooking < ActiveRecord::Migration[8.0]
  def change
    create_join_table :flights, :bookings do |t|
      # t.references :flight, null: false, foreign_key: true
      # t.references :booking, null: false, foreign_key: true
    end
  end
end
