include BCrypt

class User < ActiveRecord::Base
  has_many :friend_lists, :dependent => :destroy
  attr_accessible :full_name, :username, :email, :password, :password_confirmation
  attr_accessor :password

  validates :full_name, presence:true
  validates :username, :uniqueness => true, :length => { :minimum => 5}
  validates :email, presence:true, uniqueness:true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates_confirmation_of :password
  validates :password, :length => { :minimum => 7}

  before_save :encrypt_password

  def self.authenticate(username, password)
    user = find_by_username(username)
    if user && user.password_hash == Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = Engine.generate_salt
      self.password_hash = Engine.hash_secret(password, password_salt)
    end
  end

  def user_friend_list
    a = Array.new
    i = 0
    self.friend_lists.each do |friend|
      a[i] = User.find_by_id(friend.friend_id)
      i+=1
    end
    return a
  end
end
