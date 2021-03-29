FactoryBot.define do
  factory :buyer_address do
    postal_code { '123-4567' }
    region_id { 2 }
    city { '東京都' }
    address_line { '1-1' }
    apartment { '東京ハイツ' }
    phone_number { '00012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
