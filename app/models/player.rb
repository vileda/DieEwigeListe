class Player < ActiveRecord::Base
  has_many :fixtures
  has_many :matches, :through => :fixtures
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>", :mini => "75x75>" }, :path => ":rails_root/public/system/:attachment/:id/:style/:filename"
end
