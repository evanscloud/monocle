class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook, :google_oauth2]

  enum role: [:admin, :user]

  after_initialize :set_default_role

  has_many :collections, dependent: :destroy
  has_many :books, :through => :collections

  validates :username, :email, :uniqueness => true
  validates :username, :email, :presence => true

  def self.from_omniauth(auth)
   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
     user.email = auth.info.email
     user.password = Devise.friendly_token[0,20]
   end
  end

  def set_default_role
    self.role ||= :user
  end

end
