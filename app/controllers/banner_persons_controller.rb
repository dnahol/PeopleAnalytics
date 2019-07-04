class BannerPersonsController < ApplicationController
  include Accepted
  def index
    @banner_people = BannerPerson.all
    @houses = House.all
  end
  def show
    @banner_person = BannerPerson.find(params[:id])
    @membership = nil
    i = 0
    while @membership == nil && i < @banner_person.memberships.length
      if @banner_person.memberships[i].active == true
        @membership = @banner_person.memberships[i]
      end
      i+=1
    end
    @table = ActiveRecord::Base.connection.execute("
          SELECT COALESCE(l.date, h.date, a.date) AS cdate,
          l.pts AS lpts, h.units AS hunits, a.units AS aunits, a.id AS aid,
          h.date AS hdate, l.date AS ldate
          FROM (SELECT * FROM loyalty_points WHERE membership_id = #{@membership.id}) l
          FULL OUTER JOIN (SELECT * FROM handouts WHERE membership_id = #{@membership.id}) h
            ON l.date = h.date
          FULL OUTER JOIN (SELECT * FROM advisements WHERE membership_id = #{@membership.id}) a
            ON COALESCE(l.date, h.date) = a.date
          ORDER BY cdate ASC;
          ")
    @handouts = @banner_person.handouts
    @loyalty_points = @banner_person.loyalty_points
    gon.handouts = []
    gon.pts = []
    @table.each{|r|
      if r["hdate"]
        gon.handouts.push( [ r["hdate"], r["hunits"] ] )
      end
      if r["ldate"]
        gon.pts.push( [ r["ldate"], r["lpts"] ] )
      end
    }
    @adv_rates = Accepted.rate(table: @table)
    @rates_col = []
    cur_rate = 0.0
    @table.each_with_index do |r, i|
      if @adv_rates[r["cdate"]]
        cur_rate = @adv_rates[r["cdate"]]
      end
      @rates_col.push( '%.2f' % (100 * cur_rate) )
    end
  end
  def update
  end
end
