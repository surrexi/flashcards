FactoryGirl.define do
  factory :card do
    original_text 'hello'
    translated_text 'привет'
    user
  end
end
