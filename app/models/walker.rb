class Walker < ApplicationRecord
  belongs_to :user
  has_many :dogs, through: :appointments
  validates :age, presence: true

  has_many :service_appointments
end
