class Dog < ApplicationRecord
  belongs_to :owner
  has_many :appointments
  has_many :walkers, through: :appointments
end
