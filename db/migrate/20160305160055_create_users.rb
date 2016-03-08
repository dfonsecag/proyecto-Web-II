class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :firstname
      t.string :authtoken

      t.timestamps null: false
    end
    add_index :users, :username
  end
end
