class Membership < ApplicationRecord

  belongs_to :house
  belongs_to :banner_person
  has_many :loyalty_points
  has_many :advisements
  has_many :handouts

  def table
    ActiveRecord::Base.connection.execute("
      SELECT COALESCE(l.date, h.date, a.date) AS cdate,
      l.pts AS lpts, h.units AS hunits, a.units AS aunits, a.id AS aid,
      l.date AS ldate, h.date AS hdate, a.date AS adate
      FROM (SELECT * FROM loyalty_points WHERE membership_id = #{self.id}) l
      FULL OUTER JOIN (SELECT * FROM handouts WHERE membership_id = #{self.id}) h
        ON l.date = h.date
      FULL OUTER JOIN (SELECT * FROM advisements WHERE membership_id = #{self.id}) a
        ON COALESCE(l.date, h.date) = a.date
      ORDER BY cdate ASC;
      ")
  end

  def sorted_hts_pts
    handouts = []
    pts = []
    adv = []
    self.table.each{|r|
      if r["hdate"]
        handouts.push( [ r["hdate"], r["hunits"] ] )
      end
      if r["ldate"]
        pts.push( [ r["ldate"], r["lpts"] ] )
      end
    }
    return { 'hts' => handouts, 'pts' => pts }
  end

end
