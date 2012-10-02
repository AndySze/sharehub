class AddCollectionIdToDesign < ActiveRecord::Migration
  def change
    add_column :designs, :collection_id, :integer
  end
end
