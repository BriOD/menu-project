class User < ApplicationRecord
  has_many :reviews
  has_many :items, :through => :reviews
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  after_initialize :default_to_role
  enum role: [:normal, :admin]

   def self.from_omniauth(auth)
     where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
       user.email = auth.info.email
       user.password = Devise.friendly_token[0,20]
     end
   end

   private

   def default_to_role
     self.role ||= :normal
   end

end
