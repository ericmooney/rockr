require 'spec_helper'

describe Venue do
  it "gets created" do
    venue = FactoryGirl.create(:venue)

    expect(Venue.all).to include(venue)
  end

  it "needs a name" do
    venue = Venue.create(:name => nil)

    expect(Venue.all).not_to include(venue)
  end

  it "adds a concert" do
    venue = FactoryGirl.create(:venue)

    concert = venue.concerts.create(:artist_name => "Bruce Springsteen", :date => "2013/08/01 18:00:00")

    expect(venue.concerts).to include(concert)
  end

  it "orders venues by name" do
    venue = Venue.create(:name => "Shoreline Theater")
    venue2 = Venue.create(:name => "AAA Concert Hall")
    venue3 = Venue.create(:name => "Zed's Studio")

    expect(Venue.ordered.first.name).to eq("AAA Concert Hall")
    expect(Venue.ordered.last.name).to eq("Zed's Studio")

  end

end
