class Person < ApplicationRecord
  belongs_to :group
  has_many :invitations
  validates :first_name, uniqueness: { scope: :last_name }

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end
end
