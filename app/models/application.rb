class Application < ApplicationRecord
        #belongs_to :student, class_name: "student", foreign_key: "student_id"
        has_attached_file :profile_picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/student-default.jpg"
        validates_attachment_content_type :profile_picture, content_type: /\Aimage\/.*\z/

         validates_uniqueness_of :student_id, :on => :create
         validates_presence_of :reg_number, :on => :create
         validates_presence_of :sex, :on => :create
         validates_presence_of :level, :on => :create
         validates_presence_of :academic_year, :on => :create
         validates_presence_of :sponsor, :on => :create
         validates_presence_of :telephone, :on => :create
         validates_presence_of :profile_picture, :on => :create

         def self.search(query)
                where("reg_number like ?", "%#{query}%")
         end
    
    
end
