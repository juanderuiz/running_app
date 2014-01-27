class CreateTrainings < ActiveRecord::Migration
  def change
    create_table :trainings do |t|
      t.integer :kms
      t.string :time
      t.date :date
      t.integer :runner_id
      t.string :description
      t.string :comments

      t.timestamps
    end
  end
end
