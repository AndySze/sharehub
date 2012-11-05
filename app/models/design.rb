class Design < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  attr_accessible :image, :title,  :collection_id, :category_id,:tag_ids

  mount_uploader :image, DesignUploader

  validates :title,:presence => true,:length => {maximum:100},on: :update
  validates :image,:presence => true,on: :create
  validates :collection_id,:presence => true, on: :update

  belongs_to :collection
  has_and_belongs_to_many :tags


  #one convenient method to pass jq_upload the necessary information
  def to_jq_upload
    {
      "name" => read_attribute(:image),
      "size" => image.size,
      "url" => image.url,
      "thumbnail_url" => image.thumb.url,
      "delete_url" => design_path(:id => id),
      "delete_type" => "DELETE"
    }
  end

end
