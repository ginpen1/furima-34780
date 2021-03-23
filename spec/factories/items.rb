FactoryBot.define do
  factory :item do
    name             { 'テスト' }
    text             { 'テキスト' }
    category_id      { '2' }
    state_id         { '2' }
    postage_id       { '2' }
    region_id        { '2' }
    shipping_date_id { '2' }
    price            { '300' }

    user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
