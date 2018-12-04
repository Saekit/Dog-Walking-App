class User < ApplicationRecord
  has_many :owners
  has_many :walkers
  has_many :admins
end
