class CreateDbConnects < ActiveRecord::Migration
  def change
    create_table :db_connects do |t|
      t.string :data_base, :null => false
      t.string :username, :null => false
      t.string :password,  :null => false

      t.timestamps null: false
    end
  end
end
