class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.boolean :radiant_win
      t.integer :valve_match_id
      t.integer :valve_seq_id

      t.timestamps
    end
  end
end
