class User < ActiveRecord::Base
  has_secure_password
  has_many :tweets
  
  def slug
    
  end
  
  def self.find_by_slug
    
  end
  
end
