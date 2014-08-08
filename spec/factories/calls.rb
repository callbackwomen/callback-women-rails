FactoryGirl.define do
  factory :call do
    due_date "2015/07/04"
    association :conference, factory: :conference
  end
end



