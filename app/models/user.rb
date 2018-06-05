class User < ApplicationRecord
  # Direct associations

  has_many   :friend_followers,
             :class_name => "FriendRequest",
             :foreign_key => "recipient_id",
             :dependent => :destroy

  has_many   :friend_requests,
             :foreign_key => "sender_id",
             :dependent => :destroy

  has_many   :bean_likes,
             :dependent => :destroy

  has_many   :roaster_follows,
             :dependent => :destroy

  # Indirect associations

  has_many   :roasters_follows,
             :through => :roaster_follows,
             :source => :roaster

  # Validations

  validates :username, :uniqueness => true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
