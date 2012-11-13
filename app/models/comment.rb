class Comment < ActiveRecord::Base
  attr_accessible :content, :design_id, :user_id

  validates :content, presence: true
  validates :user_id, presence: true

  belongs_to :design

  def user
    User.find(self.user_id)
  end

end
