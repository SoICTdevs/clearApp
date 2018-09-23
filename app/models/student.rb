class Student < ApplicationRecord
    attr_accessor :password
    before_save :encrypt_password
    before_create { generate_token(:auth_token) }

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true
    validates :reg_number, presence: true
    validates :password, presence: true
    validates :password_confirmation, confirmation: true

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
