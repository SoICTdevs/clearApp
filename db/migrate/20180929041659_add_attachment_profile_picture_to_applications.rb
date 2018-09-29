class AddAttachmentProfilePictureToApplications < ActiveRecord::Migration[5.2]
  def self.up
    change_table :applications do |t|
      t.attachment :profile_picture
    end
  end

  def self.down
    remove_attachment :applications, :profile_picture
  end
end
