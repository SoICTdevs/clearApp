class Student < ApplicationRecord

    has_attached_file :profile_picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/student-default.jpg"
    validates_attachment_content_type :profile_picture, content_type: /\Aimage\/.*\z/

    attr_accessor :password
    before_save :encrypt_password, only: [:new, :create]
    before_create { generate_token(:auth_token) }

    validates_presence_of :password, :on => :create
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true
    validates :reg_number, presence: true
    validates :password, confirmation: true
   

    def self.authenticate(email, password)
        student = find_by_email(email)
        if student && student.password_hash == BCrypt::Engine.hash_secret(password, student.password_salt)
            student
        else
            nil
        end
    end
    def encrypt_password
        if password.present?
            self.password_salt = BCrypt::Engine.generate_salt
            self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
        end 
    end

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
