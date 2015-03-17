# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :document do
    title "MyString"
    date_validity "2015-03-15"
    checkout false
    notification_period "MyString"
  end
end
