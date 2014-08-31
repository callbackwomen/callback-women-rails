class Conference < ActiveRecord::Base
  has_many :calls

  has_many :conference_topics
  has_many :topics, through: :conference_topics

  validates_presence_of :name, :location

  def current_call
    self.calls.present? ? self.calls.first.due_date : false
  end
end
