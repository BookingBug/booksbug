FactoryGirl.define do
  factory :book do
    title Faker::Book.title
    # owner nil
  end
end
