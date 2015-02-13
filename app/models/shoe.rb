class Shoe < ActiveRecord::Base
  after_initialize :default_values
 
  belongs_to :runner
  has_many :trainings
  validates :nombre, :presence => true, :length => { :maximum => 35 }

  # This method associates the attribute ":avatar" with a file attachment
  has_attached_file :avatar, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def add_kms(kms)
    self.totalkms += kms
    self.save
  end

  def subtract_kms(kms)
    self.totalkms -= kms
    self.save
  end

  private

  def default_values
    self.totalkms ||= 0
  end

end
