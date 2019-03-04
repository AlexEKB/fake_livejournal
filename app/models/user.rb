class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    # Uncomment the section below if you want users to be created if they don't exist
    user ||= User.create(provider: access_token.provider,
                         uid: access_token.uid,
                         email: data['email'],
                         password: Devise.friendly_token[0, 20])
    user
  end

  # def username
  #   email.split('@')[0].capitalize
  # end
end
