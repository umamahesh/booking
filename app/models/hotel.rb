class Hotel < ActiveRecord::Base
  
  validates_presence_of :name, :description, :rooms
  
  
end