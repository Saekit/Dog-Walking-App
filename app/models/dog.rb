class Dog < ApplicationRecord
  belongs_to :owner
  has_many :appointments
  has_many :walkers, through: :appointments

  validates :name, :age, :breed, :size, :friendliness, presence: true
end
