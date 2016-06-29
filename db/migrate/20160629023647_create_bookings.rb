class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.timestamp :start_date
      t.timestamp :end_date
      t.decimal :price
      t.references :space
      t.references :organization

      t.timestamps null: false
    end
  end
end
