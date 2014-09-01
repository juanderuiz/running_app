class RemoveAgeFromRunners < ActiveRecord::Migration
  def change
    remove_column :runners, :age, :integer
  end
end
