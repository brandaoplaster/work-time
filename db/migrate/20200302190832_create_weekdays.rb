class CreateWeekdays < ActiveRecord::Migration[5.2]
  def change
    create_table :weekdays do |t|
      t.date :current_day
      t.references :user, foreign_key: true
      
      t.timestamps
    end
  end
end
