FactoryBot.define do
  factory :user do
    name {"テストユーザー"}
    password {"password"}
    password_confirmation {"password"}
  end
end
