
FactoryGirl.define do
  factory :slide, :class => Refinery::Slides::Slide do
    sequence(:title) { |n| "refinery#{n}" }
    live_at { 1.hour.ago }
  end
end

