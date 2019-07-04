class AdvisementsController < ApplicationController
  def index
    @advisements = Advisement.all
  end
  def show
    @advisement = Advisement.find(params[:id])
  end
  def edit
    @advisement = Advisement.find(params[:id])
  end
  def update
    @advisement =
      Advisement.find(params[:id])
    if @advisement.update_attributes(advisement_params)
      redirect_to(:action => 'show', :id => @advisement.id)
    else
      render action: :edit
    end
  end
  private
  	def advisement_params
      params.require(:advisement).permit(:units)
    end
end
