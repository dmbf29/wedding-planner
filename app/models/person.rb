class Person < ApplicationRecord
  validates :first_name, uniqueness: { scope: :last_name }
end
