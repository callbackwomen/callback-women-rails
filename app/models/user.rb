class User < ActiveRecord::Base
  validates_presence_of :name, :provider, :uid

  def self.find_or_create_using_omniauth(auth_hash)
    return nil unless well_formatted?(auth_hash)

    User.create_with(name:      auth_hash[:info][:name],
                     provider:  auth_hash[:provider])
        .find_or_create_by uid: auth_hash[:uid]
  end

  private
  def self.well_formatted?(auth_hash)
    auth_hash.present? &&
      auth_hash.fetch(:info, {})[:name].present? &&
      auth_hash[:provider].present? &&
      auth_hash[:uid].present?
  end
end
