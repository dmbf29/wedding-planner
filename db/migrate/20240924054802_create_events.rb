class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :name
      t.date :date
      t.text :notes_meal
      t.text :notes_location
      t.text :notes_attire

      t.timestamps
    end
  end
end
