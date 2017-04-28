FactoryGirl.define do
  factory :action do
    user { create(:user) }
    book { create(:book) }
    kind :borrow
    created_at { DateTime.now }
  end
end
