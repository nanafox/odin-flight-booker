class CreatePassengers < ActiveRecord::Migration[8.0]
  def change
    create_table :passengers do |t|
      t.string :email, null: false
      t.string :name, null: false

      t.timestamps
    end
    add_index :passengers, :email
  end
end
