class Call < ActiveRecord::Base
  belongs_to :conference
  validates_presence_of :conference
end
