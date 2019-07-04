class BannerPersonsController < ApplicationController
  include Accepted
  def index
    @banner_people = BannerPerson.all
    @houses = House.all
  end
  def show
    @banner_person = BannerPerson.find(params[:id])
    @membership = @banner_person.active
    @rates_col = Accepted.col(membership: @membership)

    @hts_pts = @membership.sorted_hts_pts
    gon.handouts = @hts_pts["hts"]
    gon.pts = @hts_pts["pts"]

  end
  def update
  end
end
