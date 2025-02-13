class AddFlightsToInvitations < ActiveRecord::Migration[7.1]
  def change
    add_column :parties, :arrival, :date
    add_column :parties, :departure, :date
    change_column_default :parties, :status, from: nil, to: 'pending'
    change_column_default :invitations, :status, from: nil, to: 'pending'
  end
end
