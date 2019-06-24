class BannerPersonsController < ApplicationController
  def index
    @banner_people = BannerPerson.all
    @houses = House.all
  end
  def show
    @banner_person = BannerPerson.find(params[:id])
    @handouts = @banner_person.handouts
    gon.handouts = []
    @handouts.each{|h| gon.handouts.push( [h.date, h.units] )}

    @loyalty_points = @banner_person.loyalty_points
    gon.pts = []
    @loyalty_points.each{|l| gon.pts.push( [l.date, l.pts] )}

    @membership = nil
    i = 0
    while @membership == nil && i < @banner_person.memberships.length
      if @banner_person.memberships[i].active == true
        @membership = @banner_person.memberships[i]
      end
      i+=1
    end
    p "membership:"
    p @membership

    @table = @membership.table

  end
  def update
  end
end
