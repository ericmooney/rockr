class VenuesController < ApplicationController
  def new
    @venue = Venue.new
  end

  def create
    Venue.create(params[:venue])

    @venues = Venue.ordered.includes(:concerts)

    render :template => "concerts/create"
  end
end
