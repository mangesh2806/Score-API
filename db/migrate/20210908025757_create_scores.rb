class CreateScores < ActiveRecord::Migration[6.1]
  def change
    create_table :scores do |t|
      t.string :playerName
      t.string :score
      t.time :time
      t.timestamps
    end
  end
end
