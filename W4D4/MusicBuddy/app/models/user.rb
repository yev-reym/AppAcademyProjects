# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  validates :email, :password_digest, :session_token, presence: true
  validates :password, length: {minimum: 6}, allow_nil: true

  attr_reader :password

  after_initialize :ensure_session_token

    def self.find_by_credentials(email, password)
        user = self.find_by(email: email)

        if user && user.is_password?(password)
            user
        else 
            nil
        end
    end

    def reset_session_token!
        new_session_token = self.class.generate_session_token
        self.update!(session_token: new_session_token)
        self.session_token
    end

    def password=(password)
        @password = password
        hashed_pass = BCrypt::Password.create(password)
        self.password_digest = hashed_pass
    end

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

  private

  def self.generate_session_token
      SecureRandom::urlsafe_base64
  end 

  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end
end
