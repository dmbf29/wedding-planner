class Party < ApplicationRecord
  belongs_to :event
  has_many :invitations, dependent: :destroy
  enum status: { pending: 'pending', viewed: 'viewed', completed: 'completed' }
end
