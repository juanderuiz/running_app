class AddHoursMinutesAndSecondsToTrainings < ActiveRecord::Migration
  def change
    add_column :trainings, :hours, :integer
    add_column :trainings, :minutes, :integer
    add_column :trainings, :seconds, :integer
  end
end
