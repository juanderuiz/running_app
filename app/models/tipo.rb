class Tipo < ActiveRecord::Base
  validates :nombre, :presence => true, :length => {:maximum => 20}
  validates :descripcion, :presence => true, :length => {:maximum => 50}
end
