require 'rails_helper'

RSpec.describe Reservation, type: :model do  

  before do 
    hotel = FactoryGirl.create(:hotel)
    user = FactoryGirl.create(:user)
    @reservation = Reservation.new(:hotel => hotel, :user => user, :rooms => 1, :booked_date => Date.today, :start_time => Time.now, :end_time => Time.now+30)
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
  

end
