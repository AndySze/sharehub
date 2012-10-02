require 'digest/sha1'
class User < ActiveRecord::Base
  attr_accessible :email, :name, :user_type, :password, :confirm_password

  validates :name,:presence => true,:uniqueness => true
  validates :email,:format => {:with => /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i},
            :confirmation => true, :presence => true
  validates :password, :length => {minimum: 6} ,:on => :create
  validates :user_type, :presence => true

  has_many :designs, :dependent => :destroy
  has_many :collections, :dependent => :destroy

  before_save :create_hashed_password
  after_save :clear_password

  attr_accessor :password, :confirm_password

  attr_protected :hashed_password, :salt

  def self.make_salt(name="")
    Digest::SHA1.hexdigest("User #{name} #{Time.now} to make salt")
  end

  def self.hash_with_salt(password="",salt="")
    Digest::SHA1.hexdigest("Put #{salt} on the #{password}")
  end

  def self.authenticate(name="",password="")
    user = User.find_by_name(name)
    if user && user.password_match?(password)
      return user
    else
      return false
    end
  end

  def password_match?(password="")
    hashed_password == User.hash_with_salt(password,salt)
  end

  private

  def create_hashed_password
    unless password.blank?
      if password == confirm_password
        self.salt = User.make_salt(name) if salt.blank?
        self.hashed_password = User.hash_with_salt(password, salt)
      else
        return false
      end
    end
  end

  def clear_password
    self.password = nil
  end


end
