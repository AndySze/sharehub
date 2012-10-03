class Collection < ActiveRecord::Base
  attr_accessible :name, :user_id

  validates :name,presence:true
  validates_uniqueness_of :name,:scope => :user_id
  has_many :designs, :dependent => :destroy
  belongs_to :users

end
