class AddDayTimeAndWeekTimeAndMonthTimeAndTotalTimeToRecords < ActiveRecord::Migration[6.0]
  def change
    add_column :records, :day_time, :integer, default: 0
    add_column :records, :week_time, :integer, default: 0
    add_column :records, :month_time, :integer, default: 0
    add_column :records, :total_time, :integer, default: 0
  end
end