class CreateHeros < ActiveRecord::Migration
  def change
    create_table :heros do |t|
      t.string :name
      t.decimal :win_week

      t.timestamps
    end
  end
end
