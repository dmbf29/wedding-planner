class Event < ApplicationRecord
  belongs_to :celebration
  has_many :invitations
end
