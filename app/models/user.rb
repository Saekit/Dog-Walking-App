class User < ApplicationRecord
  has_one :owner
  has_one :walker
  has_many :admins
  validates_uniqueness_of :username
  validates  :email, :username, :role, :password, presence: true

  enum role: { owner: "owner", walker: "walker",  admin: "admin" }

  has_secure_password

end
