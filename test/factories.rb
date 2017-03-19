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

  # Indicator factory set up
  factory :indicator do
    association :competency
    association :level
    description "Able to identify common nonverbal cues."
    active true
  end

end