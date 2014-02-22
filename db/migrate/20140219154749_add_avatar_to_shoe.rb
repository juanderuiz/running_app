class AddAvatarToShoe < ActiveRecord::Migration
  def self.up
    add_attachment :shoes, :avatar
  end

  def self.down
    remove_attachment :shoes, :avatar
  end
end
