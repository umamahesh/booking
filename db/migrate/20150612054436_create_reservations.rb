class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :hotel_id
      t.integer :rooms
      t.date :booked_date
      t.time :start_time
      t.time :end_time     
      t.timestamps
    end
  end
end
