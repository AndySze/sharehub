class Design < ActiveRecord::Base
  attr_accessible :image, :title, :user_id, :collection_id, :category_id,:tag_ids

  validates :title,:presence => true,:length => {maximum:100}
  validates :image,:presence => true
  validates :collection_id,:presence => true

  belongs_to :collections
  has_and_belongs_to_many :tags
end
