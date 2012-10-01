class Design < ActiveRecord::Base
  attr_accessible :image, :title, :user_id

  validates :title,:presence => true,:length => {maximum:100}
  validates :image,:presence => true

  belongs_to :users
end
