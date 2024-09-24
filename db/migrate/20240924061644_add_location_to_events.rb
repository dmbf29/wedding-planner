class AddLocationToEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :location, :string
    add_column :events, :address, :string
    remove_column :events, :date, :date
    add_column :events, :date, :datetime
  end
end
