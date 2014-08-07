class CreateCalls < ActiveRecord::Migration
  def change
    create_table :calls do |t|
      t.datetime :due_date
      t.references :conference

      t.timestamps
    end
  end
end
