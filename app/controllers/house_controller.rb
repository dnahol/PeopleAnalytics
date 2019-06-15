class HouseController < ApplicationController
  def index
    @houses = House.all

  end
end
