class CreateTopicsAndConferenceTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :name

      t.timestamps
    end

    create_table :conference_topics do |t|
      t.references :conference
      t.references :topic

      t.timestamps
    end
  end
end
