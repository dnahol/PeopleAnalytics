class Advisement < ApplicationRecord
  include Accepted
  belongs_to :membership

  after_initialize :set_accepted

  def set_accepted
    # self.accepted = 0.5
    # testing ActiveSupport Concerns
    self.accepted = Accepted.rate(advisement: self, handouts: self.membership.handouts)
  end
end
