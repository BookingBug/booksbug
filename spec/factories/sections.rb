FactoryGirl.define do
  factory :section do
    name { Faker::Book.genre }
  end
end