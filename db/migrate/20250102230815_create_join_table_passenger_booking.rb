class CreateJoinTablePassengerBooking < ActiveRecord::Migration[8.0]
  def change
    create_join_table :passengers, :bookings do |t|
      # t.references :passenger, null: false, foreign_key: true
      # t.references :booking, null: false, foreign_key: true
    end
  end
end
