class Reservation < ActiveRecord::Base
  
  belongs_to :hotel
  belongs_to :user
  
  validates_presence_of :hotel, :user, :booked_date, :start_time, :end_time
  validates :rooms, presence: true, numericality: { greater_than: 0 }
  #validate :start_date_cannot_be_in_the_past
 
  
  
  
  def start_date_cannot_be_in_the_past
    if start_time && start_time < Date.today
      errors.add(:start_time, 'must be at least 15 minutes from present time')
    end
  end
  
  
end
