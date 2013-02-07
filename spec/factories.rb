FactoryGirl.define do
  factory :user do
    name "name"
    email "a@b.com"
  end

  factory :question do
    question "What's your favorite number?"
  end

  factory :answer do
    answer "answer"
    question_id 1
    diva_id 1
  end

  factory :diva do
    name "Diva"
  end

  factory :user_answer do
    user_id 1
    question_id 1
    answer_id 1
  end
end