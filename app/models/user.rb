class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
  :rememberable, :trackable, :validatable, :omniauthable

  include DeviseTokenAuth::Concerns::User


  def self.from_facebook_token(token, user_id, expires_at)
    fb_user = FbGraph2::User.me(token).fetch(fields: 'email,first_name,last_name,id')
    user = User.find_by(provider: :facebook, uid: user_id)
    if user.blank?
      user = User.create!(provider: :facebook, uid: user_id, name:  "#{fb_user.first_name} #{fb_user.last_name}", email: fb_user.email, password: Devise.friendly_token[0, 20])
    end
    binding.pry

    user
  end
end
