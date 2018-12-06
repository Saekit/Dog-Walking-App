class ServiceAppointment < ApplicationRecord
belongs_to :appointment
belongs_to :service
belongs_to :walker

end
