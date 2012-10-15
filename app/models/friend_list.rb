class FriendList < ActiveRecord::Base
  belongs_to :user
  attr_accessible :friend_id, :user_id
end
