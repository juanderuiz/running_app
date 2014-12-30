class ChangeTimeTypeToInteger < ActiveRecord::Migration
  def up
    change_column :trainings, :time, 'integer USING CAST(time AS integer)'
  end

  def down
    change_column :trainings, :time, :string
  end
end
