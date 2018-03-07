class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:instagram]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      binding.pry
      user.email = "#{auth.extra['raw_info']['username']}@gmail.com"
      user.provider = auth.provider
      user.uid = auth.uid
      user.token = auth.credentials['token']
      user.password = Devise.friendly_token[0,20]
      user.save!
    end
  end

end