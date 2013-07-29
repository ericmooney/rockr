require 'spec_helper'

describe Concert do

  it "gets created" do
    venue = Venue.create(:name => "Shoreline Theater")

    concert =  venue.concerts.create(:artist_name => "Bruce Springsteen", :date => "2013/08/01 18:00:00")
    expect(Concert.all).to include(concert)
  end


  it "needs a venue" do
    concert = Concert.create(:artist_name => "Bruce Springsteen", :date => "2013/08/01 18:00:00")

    expect(Concert.all).not_to include(concert)
  end

  it "requires an artist name" do
    venue = Venue.create(:name => "Shoreline Theater")

    concert = venue.concerts.create(:date => "2013/08/01 18:00:00")
    expect(Concert.all).not_to include(concert)
  end

  it "requires a date" do
    venue = Venue.create(:name => "Shoreline Theater")

    concert = venue.concerts.create(:artist_name => "Bruce Springsteen")

    expect(Concert.all).not_to include(concert)
  end

  it "requires a valid date" do
    venue = Venue.create(:name => "Shoreline Theater")

    concert =  venue.concerts.create(:artist_name => "Bruce Springsteen", :date => "2013/08")
    expect(Concert.all).not_to include(concert)
  end

end
