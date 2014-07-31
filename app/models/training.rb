class Training < ActiveRecord::Base
  after_initialize :default_values

	validates :description, :presence => true, :length => { :maximum => 140 }
	validates :comments, :length => { :maximum => 140 }
	belongs_to :runner
	validates :runner, :presence => true

  belongs_to :shoe

  validates :kms, presence: true, numericality: {greater_than_or_equal_to: 0.01, less_than_or_equal_to: 50.00}
  validates :hours, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 9  }
	validates :minutes, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 59 }
	validates :seconds, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 59 }

  private
    def default_values
      self.hours ||= 0
      self.minutes ||= 0
      self.seconds ||= 0
    end

    def self.latest
      Training.order(:updated_at).last
    end

end
