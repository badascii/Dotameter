class AddDurationAndStartTimeToMatch < ActiveRecord::Migration
  def change
    add_column :matches, :duration, :integer
    add_column :matches, :start_time, :bigint
  end
end
