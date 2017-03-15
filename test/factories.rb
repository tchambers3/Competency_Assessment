FactoryGirl.define do

  # Competency factory set up
  factory :competency do
    name "Communication"
    description "Take the Communication assessment to see how well you perform in the Communication Competency."
    active true
  end

  # Level factory set up
  factory :level do
    name "Champion"
    description "The highest level of indicators."
    ranking 1
    active true
  end

  # Question factory set up
  factory :question do
    question "When I have something to say, I prepare by organizing my thoughts and outlinging my intention."
    active true
  end

end
