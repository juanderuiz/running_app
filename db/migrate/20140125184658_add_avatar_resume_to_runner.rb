class AddAvatarResumeToRunner < ActiveRecord::Migration
  def self.up
    add_attachment :runners, :avatar
  end

  def self.down
    remove_attachment :runners, :avatar
  end
end
