class CreateShoes < ActiveRecord::Migration
  def change
    create_table :shoes do |t|
      t.integer :runner_id
      t.text :nombre
      t.integer :totalkms

      t.timestamps
    end
    #add_index :runner_id
  end
end
