class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable

  def self.find_facebook_user(auth)
    user = User.find_by(uid: auth.id, provider: auth.provider)

    unless user
      user = User.create(
        uid: auth.id,
        provider: auth.provider,
        email: auth.info.email,
        password: Devise.friendly_token[0, 20],
        name: auth.info.name,
        image: auth.info.image
      )
    end

    return user
  end

end
