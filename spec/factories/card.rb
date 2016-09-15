FactoryGirl.define do

  factory :user do
    original_text 'hello'
    translated_text 'привет'
    review_date Date.today + 3.days
  end

end
