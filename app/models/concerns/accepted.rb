module Accepted
  extend ActiveSupport::Concern
  def self.rate(advisement:, handouts:)
    # testing ActiveSupport Concerns
    handouts.length
  end
end
