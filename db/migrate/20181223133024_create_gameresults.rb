class CreateGameresults < ActiveRecord::Migration[5.2]
  def change
    create_table :gameresults do |t|
      t.integer :wins, default: 0
      t.integer :loses, default: 0
      t.integer :seasons, default: 1
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
