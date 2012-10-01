class CreateDesigns < ActiveRecord::Migration
  def up
    create_table :designs do |t|
      t.string :title
      t.string :image

      t.timestamps
    end
    add_index("designs","title")
  end

  def down
    remove_index("designs","title")
    drop_table :designs
  end

end
