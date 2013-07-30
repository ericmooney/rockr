require 'spec_helper'

describe Concert do

  it "gets created" do
    concert = FactoryGirl.create(:concert)

    expect(Concert.all).to include(concert)
  end


  it "needs a venue" do
    concert = Concert.create(:artist_name => "Bruce Springsteen", :date => "2013/08/01 18:00:00")

    expect(Concert.all).not_to include(concert)
  end

  it "requires an artist name" do
    venue = FactoryGirl.create(:venue)

    concert = venue.concerts.create(:date => "2013/08/01 18:00:00")
    expect(Concert.all).not_to include(concert)
  end

  it "requires a date" do
    venue = FactoryGirl.create(:venue)

    concert = venue.concerts.create(:artist_name => "Bruce Springsteen")

    expect(Concert.all).not_to include(concert)
  end

  # need to figure out the validate the date in the model
  #
  # it "requires a valid date" do
  #   venue = FactoryGirl.create(:venue)

  #   concert =  venue.concerts.create(:artist_name => "Bruce Springsteen", :date => "2013/08")
  #   expect(Concert.all).not_to include(concert)
  # end

  it "orders concerts by venue time" do
    venue = FactoryGirl.create(:venue)

    venue.concerts.create(:artist_name => "Bruce Springsteen", :date => Time.now.tomorrow)
    venue.concerts.create(:artist_name => "Sublime", :date => Time.now.yesterday)
    venue.concerts.create(:artist_name => "Metallica", :date => Time.now)

    expect(venue.concerts.ordered.first.artist_name).to eq("Sublime")
    expect(venue.concerts.ordered.last.artist_name).to eq("Bruce Springsteen")

  end

end
