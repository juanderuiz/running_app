class ChangeKmsTypeToDecimal < ActiveRecord::Migration
  def up
    change_column :trainings, :kms, :decimal, precision: 5, scale: 2
  end

  def down
    change_column :trainings, :kms, :integer
  end
end
