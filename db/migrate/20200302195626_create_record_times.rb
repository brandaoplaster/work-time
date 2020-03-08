class CreateRecordTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :record_times do |t|
      t.time :time_stamp
      t.references :weekday, foreign_key: true

      t.timestamps
    end
  end
end
