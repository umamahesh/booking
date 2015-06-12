require 'rails_helper'

RSpec.describe Hotel, type: :model do
  before(:each) do 
    @hotel = FactoryGirl.build(:hotel)
  end
  
  it "is valid with valid attributes" do 
    expect(@hotel).to be_valid
  end
  
  it "should not have errors with valid attributes" do 
    expect(@hotel).to have(0).error_on(:name)
  end
  
  it "is not valid without a name" do 
    @hotel.name = nil
    expect(@hotel).not_to be_valid 
  end
  
  it "should have error hotel for name when no name was given" do
    @hotel.name = nil
    expect(@hotel).to have(1).error_on(:name)
  end
  
  
  it "is not valid without description" do 
    @hotel.description = nil
    expect(@hotel).not_to be_valid   
  end
  
  it "should have error for hotel for description when no description was given" do
    @hotel.description = nil
    expect(@hotel).to have(1).error_on(:description)
  end
  
  
  it "is not valid without a rooms" do 
    @hotel.rooms = nil
    expect(@hotel).not_to be_valid 
  end
  
  it "should have error hotel for rooms when no rooms was given" do
    @hotel.rooms = nil
    expect(@hotel).to have(1).error_on(:rooms)
  end
end
