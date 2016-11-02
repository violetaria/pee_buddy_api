class User < ApplicationRecord
  has_secure_password

  has_many :ratings
  
  before_validation :strip_leading_trailing_spaces, :ensure_authentication_token

  validates_presence_of :email, :password_digest
  validates_uniqueness_of :email
  validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

  enum provider: { facebook: 1 }

  def ensure_authentication_token
    if self.authentication_token.blank?
      self.authentication_token = User.generate_authentication_token
    end
  end

  def self.generate_authentication_token
    authentication_token = SecureRandom.hex
    while User.exists?(authentication_token: authentication_token)
      authentication_token = SecureRandom.hex
    end
    authentication_token
  end

  def self.from_facebook_token(token, user_id, expires_at)
    user = User.find_by(provider: :facebook, uid: user_id)
    if user.blank?
      fb_user = FbGraph2::User.me(token).fetch(fields: 'email,first_name,last_name,id')
      user = User.create!(provider: :facebook,
                          uid: user_id,
                          first_name:  fb_user.first_name,
                          last_name: fb_user.last_name,
                          email: fb_user.email,
                          password: SecureRandom.base64(32))
    end
    user
  end

  def strip_leading_trailing_spaces
    self.email = self.email.lstrip.rstrip unless self.email.nil?
  end
end
