class Group < ActiveRecord::Base
  has_many :group_users
  has_many :users, :through => :group_users
  has_many :fixtures
  belongs_to :creator, :class_name => "User", :foreign_key => "creator_id"
  validates_presence_of :name
end
