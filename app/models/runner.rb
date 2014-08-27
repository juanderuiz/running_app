class Runner < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	validates :name, :presence => true, :length => {:minimum => 6}
	validates :bio, :length => {:maximum => 140}
	validates :email, :uniqueness => true
  validates :datebirth, :presence => true
  #Falta chequear la edad mínima!
  validate :at_least_18

  def at_least_18
    if self.datebirth
      errors.add(:datebirth, 'Debes tener 18 años. Lo sentimos.') if self.datebirth > 18.years.ago.to_date
      # Si tu edad de nacimiento es más 'moderna' que hoy más 18 años
    end
  end

	has_many :trainings,  dependent: :destroy
  has_many :shoes, dependent: :destroy

        #specify that the avatar is a paperclip file attachment
  #specify additional styles that you want to use in views or eslewhere
  has_attached_file :avatar, :styles => {:thumb => "100x100>"}
  
  #specify that the resume is a paperclip file attachment
  has_attached_file :resume

  has_attached_file :avatar, {
    :styles => {
      :thumb => ["50x50#", :png],
      :medium => ["100x100#", :png],
      :large => ["300x300>", :png]
    },
    :convert_options => {
      :thumb => "-gravity Center -crop 50x50+0+0",
      :thumb => "-gravity Center -crop 100x100+0+0",
    }
  }
end
