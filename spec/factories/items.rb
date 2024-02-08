FactoryBot.define do
  factory :item do
    association :user
    name                    {Faker::Name.initials}
    description             {Faker::Lorem.sentence}
    category_id             {'2'}
    condition_id            {'3'}
    shipping_fee_id         {'2'}
    prefecture_id           {'3'}
    shipping_day_id         {'2'}
    price                   {'1000'}  

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end
