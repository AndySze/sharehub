class Collection < ActiveRecord::Base
  attr_accessible :name, :user_id

  validates :name,presence:true,uniqueness:true
  has_many :designs, :dependent => :destroy
  belongs_to :users

end
