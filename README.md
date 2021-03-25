# テーブル設計

## users テーブル

| Column               | Type   | Options                   |
| --------             | ------ | -----------               |
| nickname             | string | null: false               |
| email                | string | null: false ,unique: true |
| encrypted_password   | string | null: false               |
| family_name          | string | null: false               |
| first_name           | string | null: false               |
| family_name_furigana | string | null: false               |
| first_name_furigana  | string | null: false               |
| birthday             | date   | null: false               |

### Association
- has_many :items
- has_many :purchases

## items テーブル

| Column               | Type       | Options                        |
| --------             | ------     | -----------                    |
| item_name            | string     | null: false                    |
| description_of_item  | string     | null: false                    |
| category_id          | integer    | null: false                    |
| product_condition_id | integer    | null: false                    |
| price                | integer    | null: false                    |
| burden_id            | integer    | null: false                    |
| area_id              | integer    | null: false                    |
| shipping_day_id      | integer    | null: false                    |
| user                 | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column           | Type       | Options                        |
| --------         | ------     | -----------                    |
| item_to_buy_id   | integer    | null: false, foreign_key: true |
| user_to_buy_id   | integer    | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ------     | -----------                    |
| postal_code   | string     | null: false                    |
| municipality  | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| purchase      | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase
