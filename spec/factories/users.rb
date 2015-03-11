# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "jeff"
    password "12345678"
    password_confirmation "12345678"
    sequence(:email) { |n| "user-#{n}@example.com" }
  end
end
