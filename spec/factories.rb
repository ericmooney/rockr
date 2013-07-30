FactoryGirl.define do
  factory :venue do
    name "Shoreline Theater"
  end


  factory :concert do
    artist_name "Bruce Springsteen"
    date Time.now
    venue
  end

end