class Student < ApplicationRecord
    #has_namy :applications

    attr_accessor :password
    #before_create :check_pass
    before_save :encrypt_password, only: [:new, :create]
    before_create { generate_token(:auth_token) }

     #validate_presence_of(:password, :on => :create) 


        validates :first_name, presence: true
        validates :last_name, presence: true
        validates :email, presence: true
        validates :reg_number, presence: true
    #private def check_pass
        #validates :password, presence: true 
        #validates :password, confirmation: true
   # end
   

    def self.authenticate(email, password)
        user = find_by_email(email)
        if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
            user
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

    def generate_token(column)
        begin
          self[column] = SecureRandom.urlsafe_base64
        end while Student.exists?(column => self[column])
      end
end
