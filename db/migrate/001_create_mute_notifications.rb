class CreateMuteNotifications < ActiveRecord::Migration
  def self.up
    add_column(:journals, "mute_notification", :bool, default: false)
  end

  def self.down 
  	remove_column(:journals,"mute_notification")
  end
end
