FactoryGirl.define do
  factory :conference do
    name "GoGaGaGaGa: The Spoon Conf"
    location "Seattle, WA"
    code_of_conduct true
    childcare true
    topics { build_list :topic, 1 }
  end
end
