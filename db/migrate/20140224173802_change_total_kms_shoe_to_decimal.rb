class ChangeTotalKmsShoeToDecimal < ActiveRecord::Migration
  def up
    change_column :shoes, :totalkms, :decimal, precision: 4, scale: 2
  end
  def down
    change_column :shoes, :totalkms, :integer
  end
end
