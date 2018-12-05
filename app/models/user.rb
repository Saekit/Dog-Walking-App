class User < ApplicationRecord
  has_one :owner
  has_one :walker
  has_many :admins

  enum role: { owner: "owner", walker: "walker",  admin: "admin" }


end
