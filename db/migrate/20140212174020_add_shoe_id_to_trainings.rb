class AddShoeIdToTrainings < ActiveRecord::Migration
  def change
    add_column :trainings, :shoe_id, :integer
  end
end
