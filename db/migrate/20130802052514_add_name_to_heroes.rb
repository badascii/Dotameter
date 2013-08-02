class AddNameToHeroes < ActiveRecord::Migration
  def change
    add_column :heroes, :name, :string
  end
end
