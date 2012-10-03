class Design < ActiveRecord::Base
  attr_accessible :image, :title, :user_id, :collection_id, :category_id

  validates :title,:presence => true,:length => {maximum:100}
  validates :image,:presence => true
  validates :collection_id,:presence => true

  belongs_to :collections
end
