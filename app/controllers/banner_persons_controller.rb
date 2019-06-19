class BannerPersonsController < ApplicationController
  def index

    @banner_people = BannerPerson.all
    @houses = House.all
  end
  def show
    @banner_person = BannerPerson.find(params[:id])
    @handouts = @banner_person.handouts
    gon.handouts = []
    @handouts.each{|h| gon.handouts.push(h.units)}

    @loyalty_points = @banner_person.loyalty_points
    gon.pts = []
    @loyalty_points.each{|l| gon.pts.push(l.pts)}

  end
  def update
  end
end
