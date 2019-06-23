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
    # @table = BannerPerson.joins("INNER JOIN memberships ON memberships.banner_person_id = banner_people.id")
    # @mTable = @banner_person.joins("LEFT OUTER JOIN memberships m ON #{@banner_person.id}=m.banner_person_id")
    # @table0 = BannerPerson.joins("LEFT OUTER JOIN memberships m ON banner_people.id=m.banner_person_id AND m.active = true
    #   LEFT OUTER JOIN houses h ON m.house_id=h.id
    #   LEFT OUTER JOIN loyalty_points lp ON m.id=lp.membership_id
    #   FULL OUTER JOIN (SELECT * FROM handouts WHERE memberships.id=membership_id) ht ON lp.date=ht.date
    #   FULL OUTER JOIN (SELECT * FROM advisements WHERE memberships.id=membership_id) a ON ht.date = a.date
    #   WHERE banner_people.id=#{@banner_person.id}").select("
    #   banner_people.*,
    #   m.hsid AS hsid,
    #   lp.date AS lp_date, lp.pts AS lp_pts,
    #   ht.date AS ht_date, ht.units AS ht_units,
    #   a.date AS a_date, a.units AS a_units
    #   ")
    # p @table0


    @table = ActiveRecord::Base.connection.execute("
      SELECT COALESCE(l.date, h.date, a.date) AS cdate,
      l.pts AS lpts, h.units AS hunits, a.units AS aunits, a.accepted AS acc
      FROM (SELECT * FROM loyalty_points WHERE membership_id = #{@membership.id}) l
      FULL OUTER JOIN (SELECT * FROM handouts WHERE membership_id = #{@membership.id}) h ON l.date = h.date
      FULL OUTER JOIN (SELECT * FROM advisements WHERE membership_id = #{@membership.id}) a ON l.date = a.date
      ORDER BY cdate ASC;
      ")
    # @table.each do |r|
    #   p r
    # end
# WHERE memberships.id=#{@membership.id}
      # AND m.id=ht.membership_id
      # AND m.id=a.membership_id
      # AND m.id=#{@banner_person.membership}
  end
  def update
  end
end
