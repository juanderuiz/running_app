class AddYearMonthAndDayToRunners < ActiveRecord::Migration
  def change
    add_column :runners, :year, :integer
    add_column :runners, :month, :integer
    add_column :runners, :day, :integer
  end
end
