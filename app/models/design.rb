class Design < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  attr_accessible :image, :title,  :collection_id, :category_id,:tag_ids

  mount_uploader :image, DesignUploader

  validates :title,:presence => true,:length => {maximum:100},on: :update
  validates :image,:presence => true,on: :create
  validates :collection_id,:presence => true, on: :update

  belongs_to :collection
  has_and_belongs_to_many :tags


end
