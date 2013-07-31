class CreateHeros < ActiveRecord::Migration
  def change
    create_table :heros do |t|

      t.timestamps
    end
  end
end
