class BannerPerson < ApplicationRecord
  has_many :memberships
  has_many :houses, through: :memberships
  has_many :loyalty_points, through: :memberships
  has_many :advisements, through: :memberships
  has_many :handouts, through: :memberships

  def active
    membership = nil
    i = 0
    while membership == nil && i < self.memberships.length
      if self.memberships[i].active == true
        membership = self.memberships[i]
      end
      i+=1
    end
    return membership
  end
  
end
