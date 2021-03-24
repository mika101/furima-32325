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

| Column              | Type       | Options                        |
| --------            | ------     | -----------                    |
| item_name           | string     | null: false                    |
| description_of_item | string     | null: false                    |
| category            | string     | null: false                    |
| product_condition   | string     | null: false                    |
| price               | integer    | null: false                    |
| burden_id           | integer    | null: false, foreign_key: true |
| area_id             | integer    | null: false, foreign_key: true |
| shipping_day_id     | integer    | null: false, foreign_key: true |
| user                | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :selling price
- has_one :purchase

## purchases テーブル

| Column           | Type       | Options                        |
| --------         | ------     | -----------                    |
| price            | integer    | null: false                    |
| credit card      | integer    | null: false                    |
| shipping address | string     | null: false                    |
| items_id         | references | null: false, foreign_key: true |
| user_id          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping address
- has_one :delivery
- has_one :credit card

## delivery テーブル

| Column        | Type       | Options                        |
| ------------- | ------     | -----------                    |
| burden        | string     | null: false                    |
| area          | string     | null: false                    |
| shipping days | string     | null: false                    |
| purchase_id   | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase

## shipping address テーブル

| Column        | Type       | Options                        |
| ------------- | ------     | -----------                    |
| postal_code   | string     | null: false                    |
| municipality  | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| prefecture_id | integer    | null: false ,foreign_key: true |
| purchase_id   | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase
