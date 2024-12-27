class CreateAirports < ActiveRecord::Migration[8.0]
  def change
    create_table :airports do |t|
      t.string :code, null: false

      t.timestamps
    end
    add_index :airports, :code
  end
end
