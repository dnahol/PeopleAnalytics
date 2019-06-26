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
  end

end
