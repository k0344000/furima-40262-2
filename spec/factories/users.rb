FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.email}
    password {'test1234'}
    password_confirmation {'test1234'}
    last_name { '山田' }
    first_name { '太郎' }
    last_name_kana { 'カナ' }
    first_name_kana { 'カナ' }
    birthday { Faker::Date.birthday }
  end
end