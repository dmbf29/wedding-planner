class Person < ApplicationRecord
  belongs_to :group
  has_many :invitations
  has_many :events, through: :invitations
  validates :first_name, uniqueness: { scope: :last_name }

  def full_name
    "#{custom_titleize(first_name)} #{custom_titleize(last_name)}"
  end

  def custom_titleize(name)
    name.split(/\b/).map { |word| word.gsub(/\b\w/) { |match| match.upcase } }.join
  end
end
