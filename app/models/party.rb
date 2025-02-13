class Party < ApplicationRecord
  belongs_to :event
  has_many :invitations, dependent: :destroy
end
