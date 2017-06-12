FactoryGirl.define do
  factory :todo do
    user_id 1
    title "MyString"
    note "MyText"
    due_date "2017-06-13"
    completed_on "2017-06-13"
    repeat 1
    urgent false
  end
end
