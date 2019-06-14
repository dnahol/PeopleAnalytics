class BannerPersonsController < ApplicationController
  def index
    @banner_persons = BannerPerson.all
  end
  def show
  end
  def update
  end
end
