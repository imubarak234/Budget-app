FactoryBot.define do
  factory :user do
    name { 'MyString' }
    email { 'example@gmail.com' }
    password { 23456789 }
  end
end
