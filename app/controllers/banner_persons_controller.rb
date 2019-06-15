class BannerPersonsController < ApplicationController
  def index
    @banner_people = BannerPerson.all
    @houses = House.all
  end
  def show
  end
  def update
  end
end
