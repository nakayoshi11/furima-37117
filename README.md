users テーブル

| Column              | Type   | Options     |
| ------------------  | ------ | ----------- |
| nickname            | string | null: false |
| email               | string | null: false | ユニーク制約
| encrypted_password  | string | null: false |
| last_name           | text   | null: false |
| first_name          | text   | null: false |
| last_name_kana      | text   | null: false |
| first_name_kana     | text   | null: false |
| birth_date          | text   | null: false |

items テーブル

| Column                      | Type   | Options     |
| --------------------------  | ------ | ----------- |
| Product_name                | string | null: false |
| Product_description         | string | null: false | ユニーク制約
| Product_category            | string | null: false |
| Product_condition           | text   | null: false |
| Burden_of_shipping_charges  | text   | null: false |
| Shipping_area               | text   | null: false |
| Days_to_ship                | text   | null: false |
| Selling_price               | text   | null: false |

purchase テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| Shipping_address   | string | null: false |
| Postal_code        | string | null: false | ユニーク制約
| prefectures        | string | null: false |
| municipalities     | text   | null: false |
| address            | text   | null: false |
| Building_name      | text   | null: false |
| telephone_number   | text   | null: false |

Who_bought_what テーブル

| Column             | Type       | Options     |
| ------------------ | ------     | ----------- |
| Product_name       | references | null: false | 外部キー
| last_name          | references | null: false | 外部キー
| first_name         | references | null: false | 外部キー
| last_name_kana     | references | null: false | 外部キー
| first_name_kana    | references | null: false | 外部キー