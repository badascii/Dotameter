class AddBaseStatsToHero < ActiveRecord::Migration
  def change
    add_column :heroes, :radiant, :boolean
    add_column :heroes, :str, :integer
    add_column :heroes, :agi, :integer
    add_column :heroes, :int, :integer
    add_column :heroes, :str_per_lvl, :decimal
    add_column :heroes, :agi_per_lvl, :decimal
    add_column :heroes, :int_per_lvl, :decimal
    add_column :heroes, :hp, :integer
    add_column :heroes, :mp, :integer
    add_column :heroes, :min_dmg, :integer
    add_column :heroes, :max_dmg, :integer
    add_column :heroes, :armor, :decimal
  end
end
