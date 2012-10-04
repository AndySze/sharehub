class CreateDesignsTagsJoin < ActiveRecord::Migration
  def up
    create_table :designs_tags,:id => false do |t|
      t.integer "design_id"
      t.integer "tag_id"
    end
    add_index :designs_tags,["design_id","tag_id"]
  end

  def down
    drop_table :designs_tags
  end
end
