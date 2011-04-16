class Player < ActiveRecord::Base
  has_many :fixtures
  has_many :matches, :through => :fixtures
end
