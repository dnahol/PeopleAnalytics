class BannerPersonsController < ApplicationController
  def index

    @banner_people = BannerPerson.all
    @houses = House.all
  end
  def show
    @banner_person = BannerPerson.find(params[:id]) 
  end
  def update
  end
end
