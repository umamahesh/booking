class Hotel < ActiveRecord::Base
  
  validates_presence_of :name, :description, :rooms
  
  has_many :reservations
  
  def available_rooms
    rooms - reservations.count 
  end
  
  def available_rooms_by_date(date)
    if !reservations.blank?
    reservations = reservations.where(:booked_date => date)
    rooms - reservations.count 
    else
    rooms  
    end    
  end
  
  
end
