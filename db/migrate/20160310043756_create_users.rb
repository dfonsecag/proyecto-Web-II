class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :firstname
      t.string :password_digest

      t.timestamps null: false
    end
    add_index :users, :username
  end
end
