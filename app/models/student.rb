class Student < ApplicationRecord

    belongs_to :department, autosave: true
    belongs_to :school, autosave: true
    has_one :application, autosave: true

    has_attached_file :profile_picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/student-default.jpg"
    validates_attachment_content_type :profile_picture, content_type: /\Aimage\/.*\z/

    #has_secure_password before_save :encrypt_password, only: [:new, :create]
    before_create { generate_token(:auth_token) }

    validates_uniqueness_of :reg_number
    validates_uniqueness_of :email
    validates :first_name, presence: true
    validates :last_name, presence: true
    #validates :email, presence: true
    validates :reg_number, presence: true
    validates :school_id, presence: true
    validates :department_id, presence: true
    validates :password, confirmation: true
   

     has_secure_password

    def send_password_reset
        generate_token(:password_reset_token)
        self.password_reset_sent_at = Time.zone.now
        save!
        StudentMailer.password_reset(self).deliver
    end

    def generate_token(column)
        begin
          self[column] = SecureRandom.urlsafe_base64
        end while Student.exists?(column => self[column])
      end
end
