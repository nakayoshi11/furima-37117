users テーブル

| Column              | Type   | Options     |
| ------------------  | ------ | ----------- |
| nickname            | string | null: false |
| email               | string | null: false, unique: true|
| encrypted_password  | string | null: false |
| last_name           | string | null: false |
| first_name          | string | null: false |
| last_name_kana      | string | null: false |
| first_name_kana     | string | null: false |
| birth_date          | date   | null: false |

- has_many :items
- has_many :purchase_history

items テーブル

| Column                      | Type   | Options     |
| --------------------------  | ------ | ----------- |
| product_name                | text   | null: false |
| product_description         | text   | null: false |
| product_category_id         | integer| null: false |
| product_condition_id        | integer| null: false |
| burden_of_shipping_charge_id| integer| null: false |
| prefecture_id               | integer| null: false |
| days_to_ship_id             | integer| null: false |
| Selling_price               | integer| null: false |

- belongs_to :user
- has_one :purchase_history

addresses テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| postal_code        | string | null: false |
| prefecture_id      | integer  | null: false |
| city               | string   | null: false |
| address            | string   | null: false |
| building_name      | string   | null: false |
| telephone_number   | string   | null: false |

- belongs_to :purchase_historys

purchase_historys テーブル

| Column             | Type       | Options     |
| ------------------ | ------     | ----------- |
| item               | references | null: false, foreign_key: true|
| user               | references | null: false, foreign_key: true|

- belongs_to :user
- belongs_to :item
- has_one :purchase