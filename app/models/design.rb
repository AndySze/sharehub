class Design < ActiveRecord::Base
  attr_accessible :image, :title,  :collection_id, :category_id,:tag_ids

  mount_uploader :image, DesignUploader

  validates :title,:presence => true,:length => {maximum:100}
  validates :image,:presence => true
  validates :collection_id,:presence => true

  belongs_to :collection
  has_and_belongs_to_many :tags


end
