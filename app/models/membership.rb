class Membership < ApplicationRecord
  include Accepted
  belongs_to :house
  belongs_to :banner_person
  has_many :loyalty_points
  has_many :advisements
  has_many :handouts
  @table
  attr_reader :table

  after_initialize :set_table

  def set_table
    @table = ActiveRecord::Base.connection.execute("
      SELECT COALESCE(l.date, h.date, a.date) AS cdate,
      l.pts AS lpts, h.units AS hunits, a.units AS aunits, a.accepted AS acc
      FROM (SELECT * FROM loyalty_points WHERE membership_id = #{self.id}) l
      FULL OUTER JOIN (SELECT * FROM handouts WHERE membership_id = #{self.id}) h ON l.date = h.date
      FULL OUTER JOIN (SELECT * FROM advisements WHERE membership_id = #{self.id}) a ON l.date = a.date
      ORDER BY cdate ASC;
      ")
  end
end
