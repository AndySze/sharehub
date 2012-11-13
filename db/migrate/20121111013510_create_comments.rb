class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :design_id
      t.string :content
      t.integer :user_id

      t.timestamps
    end
  end
end
