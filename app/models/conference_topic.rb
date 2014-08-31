class ConferenceTopic < ActiveRecord::Base
  belongs_to :conference
  belongs_to :topic
end
