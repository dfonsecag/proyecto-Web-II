class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.string :authtoken
      t.string :username
      t.datetime :date

      t.timestamps null: false
    end
  end
end
