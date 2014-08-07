class Conference < ActiveRecord::Base
  has_many :calls

  validates_presence_of :name, :location
end
