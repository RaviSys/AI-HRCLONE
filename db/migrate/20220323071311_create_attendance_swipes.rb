class CreateAttendanceSwipes < ActiveRecord::Migration[7.0]
  def change
    create_table :attendance_swipes do |t|
      t.references :employee, null: false, foreign_key: true
      t.datetime :swiped_at

      t.timestamps
    end
  end
end
