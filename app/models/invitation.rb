class Invitation < ApplicationRecord
  belongs_to :group
  belongs_to :person
  enum status: { pending: 'pending', attending: 'attending', declined: 'declined' }
end
