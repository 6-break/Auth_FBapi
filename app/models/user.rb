class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :omniauthable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

# definition for find_for_facebook_oauth
def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
  user = User.where(:provider => auth.provider, :uid => auth.uid).first

  # 1
  #user.token = auth.credentials.token
  #user.save
  # 2
  #user.update(token: auth.credentials.token)

  unless user
    user = User.create(#name:     auth.extra.raw_info.name,
                       provider: auth.provider,
                       uid:      auth.uid,
                       email:    auth.info.email,
                       token:    auth.credentials.token,
                       password: Devise.friendly_token[0,20]
                      
                      ) 

  else
    #ユーザー登録済み　　tokenとe-mailアップデート 
    user.update(token: auth.credentials.token, email: auth.info.email)
  end

  user
end

  def graph
 
  Koala::Facebook::API.new(self.token)


  end

end
