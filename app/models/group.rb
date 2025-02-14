class Group < ApplicationRecord
  has_many :people
  has_many :invitations, through: :people
end
