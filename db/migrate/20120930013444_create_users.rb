class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :user_type
      t.string :hashed_password

      t.timestamps
    end
  end
end
