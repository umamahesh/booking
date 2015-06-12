class Hotel < ActiveRecord::Base
  
  validates_presence_of :name, :description, :rooms
  
  has_many :reservations
  
  def available_rooms
    rooms - reservations.count 
  end
  
  
end
