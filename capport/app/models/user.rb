class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :omniauthable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

# definition for find_for_facebook_oauth

def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
  user = User.where(:provider => auth.provider, :uid => auth.uid).first
  unless user
  user = User.create(name:     auth.extra.raw_info.name,
                     provider: auth.provider,
                     uid:      auth.uid,
                     email:    auth.info.email,
                     password: Devise.friendly_token[0,20]
                    )
  end
  user
  end

  def graph
  access_token = auth['']
    Koala::Facebook::API.new(self.access_token)
  end

end
