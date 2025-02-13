class Person < ApplicationRecord
  has_many :invitations
  has_many :parties, through: :invitations
  validates :first_name, uniqueness: { scope: :last_name }

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end
end
