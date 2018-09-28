class AddAttachmentImageToApplications < ActiveRecord::Migration[5.2]
  def self.up
    change_table :applications do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :applications, :image
  end
end
