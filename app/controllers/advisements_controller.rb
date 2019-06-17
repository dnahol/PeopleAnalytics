class AdvisementsController < ApplicationController
  def index
    @advisements = Advisement.all
  end
end
