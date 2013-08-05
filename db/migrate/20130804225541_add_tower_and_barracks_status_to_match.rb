class AddTowerAndBarracksStatusToMatch < ActiveRecord::Migration
  def change
    add_column :matches, :tower_status_radiant, :integer
    add_column :matches, :tower_status_dire, :integer
    add_column :matches, :barracks_status_radiant, :integer
    add_column :matches, :barracks_status_dire, :integer
  end
end
