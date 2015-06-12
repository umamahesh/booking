require 'rails_helper'

RSpec.describe Reservation, type: :model do  

  before do 
    hotel = FactoryGirl.create(:hotel)
    user = FactoryGirl.create(:user)
    @reservation = Reservation.new(:hotel => hotel, :user => user, :rooms => 1, :booked_date => Date.today, :start_time => Time.now, :end_time => Time.now+30*60)
  end
  
  it "is valid with valid attributes" do 
   expect(@reservation).to be_valid
  end
  it "is not valid without a hotel" do 
    @reservation.hotel = nil
    expect(@reservation).not_to be_valid
  end
  it "is not valid without user" do 
    @reservation.user = nil
    expect(@reservation).not_to be_valid
  end
  it "is not valid without a rooms" do 
    @reservation.rooms = nil
    expect(@reservation).not_to be_valid
  end
  it "is not valid without a date" do 
    @reservation.booked_date = nil
    expect(@reservation).not_to be_valid
  end
  it "is not valid without a start time" do 
    @reservation.start_time = nil
    expect(@reservation).not_to be_valid
  end
  it "is not valid without a end time" do 
    @reservation.end_time = nil
    expect(@reservation).not_to be_valid
  end
  
  it "is not valid when end time and start time are same" do
    @reservation.end_time = Time.now
    @reservation.start_time = Time.now
    expect(@reservation).not_to be_valid
    expect(@reservation).to have(2).error_on(:end_time)
  end
  
  
  it "is not valid when end time is less than 30 minutes gap with start time" do
    @reservation.end_time = Time.now+10*60
    @reservation.start_time = Time.now
    expect(@reservation).not_to be_valid
  end
  
  it "is valid when end time is more than 30 minutes gap with start time" do
    @reservation.end_time = Time.now+2.hours
    @reservation.start_time = Time.now
    expect(@reservation).to be_valid
  end
  
  it "is not valid when tried to book with 0 availability" do
    hotel = FactoryGirl.create(:hotel, :rooms => 1)
    @reservation.save(:hotel => hotel)
    user = FactoryGirl.create(:user)
    hotel = FactoryGirl.create(:hotel, :rooms => 0)
    another_reservation = Reservation.new(:hotel => hotel, :user => user, :rooms => 1, :booked_date => Date.today, :start_time => Time.now, :end_time => Time.now+30*60)
    expect(another_reservation).not_to be_valid
  end  
  
  it "after booking count decreased by 1" do
    hotel = FactoryGirl.create(:hotel, :rooms => 1)
    @reservation.save(:hotel => hotel)
    expect(@reservation.hotel.available_rooms).to eq(0)
  end
  
  
end
