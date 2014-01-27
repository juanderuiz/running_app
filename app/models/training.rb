class Training < ActiveRecord::Base
	validates :description, :presence => true, :length => { :maximum => 140 }
	validates :comments, :length => { :maximum => 140 }
	belongs_to :runner
	validates :runner, :presence => true

        validates :kms, presence: true, numericality: {greater_than_or_equal_to: 0.01, less_than_or_equal_to: 50.00}
        validates :hours, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 9  }
       #validates :hours, presence: true, numericality: { only_integer: true }
	validates :minutes, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 59 }
	validates :seconds, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 59 }

end
