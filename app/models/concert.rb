class Concert < ActiveRecord::Base
  belongs_to :venue
  attr_accessible :artist_name, :date, :venue_id

  validates_presence_of :venue, :artist_name, :date


  def self.ordered
    self.order("date ASC")
  end

end
