class User < ApplicationRecord
  has_many :posts	
  before_create :remember

  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  
  validates :password, presence: true, length: { minimum: 6 }
  has_secure_password


  def User.new_token
  	SecureRandom.urlsafe_base64
  end

  def User.digest(token)
		Digest::SHA1.hexdigest(token.to_s)
  end

  def remember
  	self.remember_token = User.digest(User.new_token)
  end

end
