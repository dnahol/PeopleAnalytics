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

     # @table = BannerPerson.joins("INNER JOIN memberships ON memberships.banner_person_id = banner_people.id")

    @table = BannerPerson.joins("LEFT OUTER JOIN memberships m ON banner_people.id=m.banner_person_id AND m.active = true
      LEFT OUTER JOIN houses h ON m.house_id=h.id
      LEFT OUTER JOIN loyalty_points lp ON m.id=lp.membership_id
      FULL OUTER JOIN handouts ht ON lp.date=ht.date AND m.id=ht.membership_id
      FULL OUTER JOIN advisements a ON ht.date = a.date AND m.id=a.membership_id
      WHERE banner_people.id=#{@banner_person.id}").select("
      banner_people.*,
      m.hsid AS hsid,
      lp.date AS lp_date, lp.pts AS lp_pts,
      ht.date AS ht_date, ht.units AS ht_units,
      a.date AS a_date, a.units AS a_units
      ")
    p @table

  end
  def update
  end
end
