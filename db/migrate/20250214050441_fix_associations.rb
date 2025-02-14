class FixAssociations < ActiveRecord::Migration[7.1]
  def change
    add_reference :events, :celebration, null: false, foreign_key: true

    rename_table :parties, :groups
    rename_column :groups, :group, :name
    remove_column :groups, :can_bring_on
    remove_reference :groups, :event
    remove_column :groups, :arrival
    remove_column :groups, :departure
    remove_column :groups, :status

    add_reference :people, :group, foreign_key: true

    remove_reference :invitations, :party
    add_reference :invitations, :event, null: false, foreign_key: true
    add_column :invitations, :wants_guest, :boolean, default: false
  end
end
