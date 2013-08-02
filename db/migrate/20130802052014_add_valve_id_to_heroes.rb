class AddValveIdToHeroes < ActiveRecord::Migration
  def change
    add_column :heroes, :valve_id, :integer
  end
end
