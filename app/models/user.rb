class User < ActiveRecord::Base
  def self.find_or_create_using_omniauth(auth_hash)
    User.create_with(name:      auth_hash[:info][:name],
                     provider:  auth_hash[:provider])
        .find_or_create_by uid: auth_hash[:uid]
  end
end
