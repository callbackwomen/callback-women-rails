class Topic < ActiveRecord::Base
  validates_uniqueness_of :name

  has_many :conference_topics
  has_many :conferences, through: :conference_topics
end
