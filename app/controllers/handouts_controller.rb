class HandoutsController < ApplicationController
  def index
    @handouts = Handout.all
  end
end
