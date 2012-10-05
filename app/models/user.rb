require 'digest/sha1'
class User < ActiveRecord::Base
  attr_accessible :email, :name, :user_type, :password, :password_confirmation

  validates :name,:presence => true,:uniqueness => true
  validates :email,:format => {:with => /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i},
            :confirmation => true, :presence => true
  validates :password, :length => {minimum: 6} ,
            :confirmation => true,:on => :create
  validates :user_type, :presence => true

  has_many :designs,:through => :collections, :dependent => :destroy
  has_many :collections, :dependent => :destroy
  has_many :tags,:through => :designs

  before_save :create_hashed_password
  after_save :clear_password,:create_default_collection

  attr_accessor :password,:password_confirmation, :confirm_password
  #confirm_password 变量已经没有用处，但删除后报错。

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
      self.salt = User.make_salt(name) if salt.blank?
      self.hashed_password = User.hash_with_salt(password, salt)
    end
  end

  def clear_password
    self.password = nil
  end

  def create_default_collection
    self.collections.create(name:"Default Collections")
  end

end

