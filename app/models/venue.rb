class Venue < ActiveRecord::Base
  has_many :concerts, :dependent => :destroy
  attr_accessible :name

  validates_presence_of :name

  def self.ordered
    self.order("name ASC")
  end

end
