class Celebration < ApplicationRecord
  has_many :events, dependent: :destroy
end
