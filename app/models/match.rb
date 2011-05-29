class Match < ActiveRecord::Base
  belongs_to :fixture
  validates_presence_of :score1
  validates_presence_of :score2
end
