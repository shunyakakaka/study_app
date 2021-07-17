class AddDayTimeAndWeekTimeAndMonthTimeAndTotalTimeToRecords < ActiveRecord::Migration[6.0]
  def change
    add_column :records, :total_time, :integer, default: 0
  end
end