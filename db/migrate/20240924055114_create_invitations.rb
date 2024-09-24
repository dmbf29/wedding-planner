class CreateInvitations < ActiveRecord::Migration[7.1]
  def change
    create_table :invitations do |t|
      t.references :party, null: false, foreign_key: true
      t.references :person, null: false, foreign_key: true
      t.string :status
      t.text :notes
      t.boolean :kids_meal

      t.timestamps
    end
  end
end
