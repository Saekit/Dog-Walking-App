class Owner < ApplicationRecord
  has_one :user
  has_many :dogs

end
