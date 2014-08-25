class AddDateOfBirthToRunners < ActiveRecord::Migration
  def change
    add_column :runners, :datebirth, :date
  end
end
