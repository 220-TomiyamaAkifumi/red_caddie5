# frozen_string_literal: true

FactoryGirl.define do
  factory :todo do
    user_id 1
    title 'MyString'
    note 'MyText'
    due_date '2017-06-11'
    repeat 1
    urgent false
  end
end
