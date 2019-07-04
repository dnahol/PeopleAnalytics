class Advisement < ApplicationRecord
  belongs_to :membership

  after_initialize :set_accepted

  def set_accepted
    Accepted.rate(advisement: self)
  end

end
