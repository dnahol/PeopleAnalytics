class BannerPersonsController < ApplicationController
  def index
    @banner_persons = BannerPerson.all
  end
end
