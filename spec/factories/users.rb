FactoryBot.define do
  factory :user do
    name { 'MyString' }
    email { 'example@gmail.com' }
    password { 23_456_789 }
  end
end
