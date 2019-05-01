class User < ApplicationRecord
    validates :user_name, :session_token, :password_digest, presence: true, uniqueness: true
    validates :password, length: { minimum: 6}, allow_nil: true 

    after_initialize :ensure_session_token

    attr_reader :password


    def reset_session_token!
        self.session_token = User.generate_session_token
        self.save!
        self.session_token
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(@password)
    end

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    def self.find_by_credentials(username, password)
        user = User.find_by(user_name: username)

        if user && user.is_password?(password)
            user
        else
            nil
        end
    end

    private 

    def ensure_session_token
        self.session_token ||= User.generate_session_token
    end

    def self.generate_session_token
        SecureRandom::urlsafe_base64
    end
end