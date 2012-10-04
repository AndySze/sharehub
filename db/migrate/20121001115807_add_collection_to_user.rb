class AddCollectionToUser < ActiveRecord::Migration
  def change
    #并不正确。无需添加该字段。
    add_column :users, :collection_id, :integer
  end
end
