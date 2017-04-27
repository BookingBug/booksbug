FactoryGirl.define do
  factory :book do
    title { Faker::Book.title }
    author { Faker::Book.author }
    section { create(:section) }
  end
end