class Application < ApplicationRecord
        #belongs_to :student, class_name: "student", foreign_key: "student_id"
         validates_uniqueness_of :student_id
    
    
end
