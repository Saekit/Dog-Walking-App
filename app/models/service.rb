class Service < ApplicationRecord
  has_many :service_appointments
  has_many :appointments, through: :service_appointments
end
