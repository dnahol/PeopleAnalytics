class House < ApplicationRecord
  has_many :memberships
  has_many :banner_persons, through: :memberships
  has_many :loyalty_points, through: :memberships
  has_many :advisements, through: :memberships
  has_many :handouts, through: :memberships
end
