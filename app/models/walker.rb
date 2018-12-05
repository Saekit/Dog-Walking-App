class Walker < ApplicationRecord
  has_one :user
  has_many :appointments
  has_many :dogs, through: :appointments
end
