class CreateRunners < ActiveRecord::Migration
  def change
    create_table :runners do |t|
      t.string :name
      t.string :email
      t.text :bio
      t.integer :age
      t.string :country

      t.timestamps
    end
  end
end
