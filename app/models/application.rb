class Application < ApplicationRecord
        #belongs_to :student, class_name: "student", foreign_key: "student_id"
         validates_uniqueness_of :student_id
         has_attached_file :image, style: {large: "600x600>", medium: "300x300>", thumb: "150x150"}
         validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
    
    
end
