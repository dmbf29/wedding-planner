class Group < ApplicationRecord
  has_many :people
  has_many :invitations, through: :people
  has_many :events, through: :invitations
end
