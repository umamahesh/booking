class HomeController < ApplicationController
  
  def index
    @hotels = Hotel.all.limit(3)
  end
  
end
