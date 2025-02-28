class Group < ApplicationRecord
  has_many :people
  has_many :invitations, through: :people
  has_many :events, through: :invitations
  accepts_nested_attributes_for :people, allow_destroy: true
end
