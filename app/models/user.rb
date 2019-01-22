class User < ApplicationRecord
  has_secure_password
  validates_presence_of :first_name, :last_name, :email, :password_digest

  has_many :posts

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.email = auth.info.email
      user.password = user.password_digest =  SecureRandom.urlsafe_base64(n=6)
      user.oauth_token = auth.credentials.token
      user.save!
    end
  end

  def name
    "#{first_name} " + "#{last_name}"
  end
end
