class AdvisementsController < ApplicationController
  def index
    @advisements = Advisement.all
  end
  def show
    @advisement = Advisement.find(params[:id])
  end
end
