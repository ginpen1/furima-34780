# テーブル設計

## users テーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false |
| password              | string | null: false |
| password_confirmation | string | null: false |
| last_name             | string | null: false |
| first_name            | string | null: false |
| last_name_kana        | string | null: false |
| first_name_kana       | string | null: false |
| birthday              | date   | null: false |

### Association
has_many :items
has_many :buyers

## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| text          | text       | null: false                    |
| category      | string     | null: false                    |
| state         | string     | null: false                    |
| postage       | string     | null: false                    |
| region        | string     | null: false                    |
| shipping_date | string     | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association
belongs_to :user
has_one :buyer

## buyers テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :item
has_one :address

## addresses テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | integer    | null: false                    |
| region       | string     | null: false                    |
| city         | string     | null: false                    |
| address_line | string     | null: false                    |
| apartment    | string     |                                |
| phone_number | integer    | null: false                    |
| buyer        | references | null: false, foreign_key: true |

### Association
belongs_to :buyer