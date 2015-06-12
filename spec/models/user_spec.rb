require 'rails_helper'

RSpec.describe User, type: :model do

  before do 
    user_params = {
      :email => 'test_user@example.com',
      :password => 'password',
      :password_confirmation => "password"
    }
    @user = User.new(user_params)
  end
  
  describe "email validation" do
    describe "when email is valid" do
      it "" do
        @user.email = "me@example.com"
        expect(@user.valid?).to eq(true)
        expect(@user).to have(0).error_on(:email)
      end
    end
    
    
    describe "when email is not valid" do
      it "" do
        @user.email = "me@"
        expect(@user.valid?).to eq(false)
        expect(@user).to have(1).error_on(:email)
        expect(@user.errors[:email]).to eq(["is invalid"])
      end
    end
  end
  
end
