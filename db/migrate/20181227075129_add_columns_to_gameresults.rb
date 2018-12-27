class AddColumnsToGameresults < ActiveRecord::Migration[5.2]
  def change
    add_column :gameresults, :ladder, :integer, :default => 1000
    add_column :gameresults, :rate, :float, :default => 0
  end
end
