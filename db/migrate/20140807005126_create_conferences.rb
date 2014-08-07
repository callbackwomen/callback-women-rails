class CreateConferences < ActiveRecord::Migration
  def change
    create_table :conferences do |t|
      t.string  :name
      t.string  :location
      t.boolean :code_of_conduct,       default: false
      t.boolean :childcare,             default: false
      t.integer :last_years_attendance, default: 0

      t.timestamps
    end
  end
end
