class Advisement < ApplicationRecord
  belongs_to :membership

  after_initialize :set_accepted

  def set_accepted
    # self.accepted = Accepted.rate(table: self.membership.@table)
  end

end
