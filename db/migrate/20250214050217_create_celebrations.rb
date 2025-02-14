class CreateCelebrations < ActiveRecord::Migration[7.1]
  def change
    create_table :celebrations do |t|
      t.string :name

      t.timestamps
    end
  end
end
