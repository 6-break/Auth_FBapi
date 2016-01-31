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
   ##account for facebook test user
 #  access_token = 'CAACGmAh9H84BADI7v4P5sXzpxwauqaLZADdt1zFvuISYiNUZAsxAZC33aVC4sUlrgZCRD7GKSx4UCICMsbZABjGf526EZALPzpudHoWvaMIZCsDu6vj8ERX3LilZA6kKFubNTq9cdbIYJ6X9Xi37YKhbtmDGfvvdbHBv70wcU47MMDxpd20kdOIqRuDFjAx2EffsUSNr6BgLbHZA8T4bH2jT0'
   #access_token = 'CAACGmAh9H84BAC2t2aSABYuDiLlW8KmnM37cfTNCp1ojBQNcQ7b6XLxDtIQRVToSFmn0sojKTVXLEgYv4LJ77ZAXOE7JUD1P2XZBPpHVZBn5AWgfRaQNZBAQMRWrWuGy8NitdbQnWIhaLS0Gq01jJrRZBEfgECSZCBh20XGUd3CqrHceZA6MaQCXReErGaDKIyGLoKRPgN7ZCAZDZD' 
   
  Koala::Facebook::API.new(self.token)
   #Koala::Facebook::API.new(self.token)
    #puts self.token
  # Koala::Facebook::API.new(access_token)

  end

end
