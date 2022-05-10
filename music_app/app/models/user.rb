class User < ApplicationRecord
    validates :email, presence: true, uniqueness: true 
    validates :session_token, :password_digest, presence: true 
    before_validation :ensure_session_token
    attr_reader :password

    #SPIRE
    def self.find_by_credentials(email, password)
        user = User.find_by(email: email)

        if user && user.is_password?(password)
            user
        else
            nil
        end
    end

    def password=(password)
        self.password_digest = BCrypt::Password.create(password)
        @password = password
    end

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    def reset_session_token!
        self.session_token = SecureRandom.urlsafe_base64
        self.save!
        self.session_token
    end

    def ensure_session_token
        self.session_token ||=SecureRandom.urlsafe_base64
    end


end
