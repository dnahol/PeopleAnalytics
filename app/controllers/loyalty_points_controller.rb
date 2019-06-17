class LoyaltyPointsController < ApplicationController
  def index
    @LPs = LoyaltyPoint.all
  end
end
