class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook, :google_oauth2]

  has_many :collections, :dependent => :destroy
  has_many :comments, :dependent => :destroy

  validates :username, :email, :uniqueness => true
  validates :username, :email, :presence => true

  def self.from_omniauth(auth)
   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
     user.username = auth.info.email.split("@")[0].gsub(/[.]/, '')
     user.email = auth.info.email
     user.password = Devise.friendly_token[0,20]
     user.password_confirmation = user.password
     user.provider = auth.provider
   end
  end

end
