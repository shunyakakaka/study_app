class CreateRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|
      t.integer :time, null: false
      t.string :task_kind
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
