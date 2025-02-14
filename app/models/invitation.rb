class Invitation < ApplicationRecord
  belongs_to :party
  belongs_to :person
  enum status: { pending: 'pending', attending: 'attending', declined: 'declined' }
end
