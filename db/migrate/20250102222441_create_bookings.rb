class CreateBookings < ActiveRecord::Migration[8.0]
  def change
    create_table :bookings do |t|
      t.integer :num_tickets, null: false

      t.timestamps
    end
  end
end
