FactoryGirl.define do
  factory :reservation do
    rooms 1
    booked_date Date.today
    start_time Time.now
    end_time Time.now+30*60  
  end

end
