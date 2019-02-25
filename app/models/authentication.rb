class Authentication < ActiveRecord::Base

belongs_to :user
# validates :provider, :uid, :presence => true

def self.from_omniauth(auth)
    

    email =  auth[:email]
    first_name = auth[:first_name].present? ? auth[:first_name] :  auth[:info][:name].split(" ").first rescue nil


    authenticate = where(provider: auth[:provider], :uid=>auth[:userID]).first_or_initialize
    if auth[:provider] == "twitter"
      email =  auth.extra.raw_info.id.to_s+"@gmail.com"
      first_name = auth[:first_name].present? ? auth[:first_name] :  auth[:info][:name].split(" ").first rescue nil
    else
      email = auth[:email].present? ? auth[:email] :  auth[:info][:email]
      first_name = auth[:first_name].present? ? auth[:first_name] :  auth[:info][:name].split(" ").first rescue nil
    end
    if authenticate.user
      authenticate.provider = auth[:provider]
      authenticate.uid =auth[:userID]
  
    else
    
      user = User.find_or_initialize_by(:email => email)
      authenticate.provider = auth[:provider]
      authenticate.uid = auth[:userID]
      authenticate.token = auth[:accessToken]

      user.first_name = first_name
     user.password = auth[:password]
   
      user.save(validate: false)
      authenticate.user_id = user.id

      # if user.errors.any?
      #   return user
      # else
      # authenticate.user_id = user.id
      # end
      # UserMailer.facebook_authentication(user).deliver 
    end
    authenticate.save
    authenticate.user

  end


  def self.react_create_account(auth)
  

    email =  auth[:email]
    first_name = auth[:first_name].present? ? auth[:first_name] :  [:name].split(" ").first rescue nil

    authenticate = where(provider: auth[:provider], :uid=>auth[:userID]).first_or_initialize
    if auth[:provider] == "twitter"
      email =  auth.extra.raw_info.id.to_s+"@gmail.com"
      first_name = auth[:first_name].present? ? auth[:first_name] :  auth[:info][:name].split(" ").first rescue nil
    else
      email = auth[:email].present? ? auth[:email] :  auth[:info][:email]
      first_name = auth[:first_name].present? ? auth[:first_name] :  auth[:info][:name].split(" ").first rescue nil
    end

    if authenticate.user
      authenticate.provider = auth[:provider]
      authenticate.uid =auth[:userID]
  
    else
    
      user = User.find_or_initialize_by(:email => email)
      authenticate.provider = auth[:provider]
      authenticate.uid = auth[:userID]
      authenticate.token = auth[:accessToken]

      user.first_name = first_name
      user.password = auth[:password]
   
      user.save(validate: false)
      authenticate.user_id = user.id
    end
    authenticate.save
    authenticate.user
  end
end
