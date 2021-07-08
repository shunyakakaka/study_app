class AddDayTimeAndWeekTimeAndMonthTimeAndTotalTimeToRecords < ActiveRecord::Migration[6.0]
  def change
    add_column :records, :day_time, :integer
    add_column :records, :week_time, :integer
    add_column :records, :month_time, :integer
    add_column :records, :total_time, :integer
  end
end
