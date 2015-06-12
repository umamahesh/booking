class Reservation < ActiveRecord::Base
  
  belongs_to :hotel
  belongs_to :user
  
  validates_presence_of :hotel, :user, :booked_date, :start_time, :end_time
  validates :rooms, presence: true, numericality: { greater_than: 0 }
  #validate :start_date_cannot_be_in_the_past
  validate :end_time_cannot_be_same_as_start_time
  validate :check_avilability_on_hotel_rooms
  validate :gap_between_end_time_and_start_time_should_be_30_min
  
  
  
  def end_time_cannot_be_same_as_start_time
    if start_time.to_i == end_time.to_i
      errors.add(:end_time, 'must not be same as start time')
    end
  end
  
  def gap_between_end_time_and_start_time_should_be_30_min
    if !start_time.blank? && !end_time.blank?
      expected_time_gap = start_time+30*60
      if end_time.to_i < expected_time_gap.to_i 
        errors.add(:end_time, 'must have 30 minutes time gap')
      end
    end
  end
  
  
  def check_avilability_on_hotel_rooms
    if !hotel.blank? && hotel.available_rooms == 0
      errors.add(:end_time, 'no rooms are available')  
    end
  end
  
  
  def start_date_cannot_be_in_the_past
    if start_time && start_time < Date.today
      errors.add(:start_time, 'must be at least 15 minutes from present time')
    end
  end
  
  
end
