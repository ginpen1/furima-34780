FactoryBot.define do
  factory :user do
    nickname              { 'テスト' }
    email                 { Faker::Internet.free_email }
    password              { 'aaa111' }
    password_confirmation { password }
    last_name             { '佐藤' }
    first_name            { '亮太' }
    last_name_kana        { 'サトウ' }
    first_name_kana       { 'リョウタ' }
    birthday              { '1930-01-01' }
  end
end
