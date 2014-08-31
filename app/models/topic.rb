class Topic < ActiveRecord::Base
  has_many :conference_topics
  has_many :conferences, through: :conference_topics
end
