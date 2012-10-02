class AddCollectionToUser < ActiveRecord::Migration
  def change
    add_column :users, :collection_id, :integer
  end
end
