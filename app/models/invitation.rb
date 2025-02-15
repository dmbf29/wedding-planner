class Invitation < ApplicationRecord
  belongs_to :event
  belongs_to :person
  enum status: { pending: 'pending', attending: 'attending', declined: 'declined' }
end
