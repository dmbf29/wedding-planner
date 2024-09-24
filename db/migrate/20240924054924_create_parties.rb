class CreateParties < ActiveRecord::Migration[7.1]
  def change
    create_table :parties do |t|
      t.string :status
      t.string :token
      t.boolean :can_bring_on
      t.string :group
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
