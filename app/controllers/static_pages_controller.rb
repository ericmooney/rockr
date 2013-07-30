class StaticPagesController < ApplicationController
  def index
    @venues = Venue.ordered.includes(:concerts)
  end
end
