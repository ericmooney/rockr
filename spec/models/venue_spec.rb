require 'spec_helper'

describe Venue do
  it "gets created" do
    venue = Venue.create(:name => "Shoreline Theater")

    expect(Venue.all).to include(venue)
  end

  it "needs a name" do
    venue = Venue.create(:name => nil)

    expect(Venue.all).not_to include(venue)
  end

  it "adds a concert" do
    venue = Venue.create(:name => "Shoreline Theater")

    concert = venue.concerts.create(:artist_name => "Bruce Springsteen", :date => "2013/08/01 18:00:00")

    expect(venue.concerts).to include(concert)
  end

end
