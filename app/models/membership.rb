class Membership < ApplicationRecord
  belongs_to :house
  belongs_to :banner_person
  has_many :loyalty_points
  has_many :advisements
  has_many :handouts
end
