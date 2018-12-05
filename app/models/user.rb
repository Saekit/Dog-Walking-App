class User < ApplicationRecord
  has_one :owner
  has_one :walker
  has_many :admins
  validates_uniqueness_of :username

  enum role: { owner: "owner", walker: "walker",  admin: "admin" }

  class User
    def password=(password) #setter/writer method
      self.password_digest = BCrypt::Password.create(password) #giving the password_digest the bcrypted password that was entered
    end
  end

end
