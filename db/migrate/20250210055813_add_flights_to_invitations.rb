class AddFlightsToInvitations < ActiveRecord::Migration[7.1]
  def change
    add_column :invitations, :arrival, :date
    add_column :invitations, :departure, :date
    change_column_default :invitations, :status, 'pending'
  end
end
