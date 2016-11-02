class AddAttachmentImageToTeacherInformations < ActiveRecord::Migration
  def self.up
    change_table :teacher_informations do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :teacher_informations, :image
  end
end
