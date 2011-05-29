class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :token_authenticatable

         has_many :groupscreated, :class_name => "Group", :foreign_key => "creator_id"
         has_one :player
         has_many :fixtures
         has_and_belongs_to_many :groups
         has_many :group_users
         has_many :groups, :through => :group_users
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :user_tokens do
      def facebook
        target.detect{|t| t.provider == 'facebook'}
      end

      def twitter
        target.detect{|t| t.provider == 'twitter'}
      end
    end
end
