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
| photo               | int        | null: false                    |
| item_name           | string     | null: false                    |
| description_of_item | string     | null: false                    |
| detail              | string     | null: false                    |
| user_id             | references | null: false, foreign_key: true |

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

## selling price テーブル

| Column   | Type       | Options                        |
| -------- | ------     | -----------                    |
| price    | integer    | null: false                    |
| fee      | integer    | null: false                    |
| profit   | integer    | null: false                    |
| items_id | references | null: false, foreign_key: true |

### Association
- belongs_to :item

## delivery テーブル

| Column        | Type       | Options                        |
| ------------- | ------     | -----------                    |
| burden        | string     | null: false                    |
| area          | string     | null: false                    |
| shipping days | string     | null: false                    |
| purchase_id   | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase

## credit card テーブル

| Column           | Type       | Options                        |
| -----------------| ------     | -----------                    |
| card information | integer    | null: false                    |
| expiration date  | date       | null: false                    |
| security code    | integer    | null: false                    |
| purchase_id      | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase

## shipping address テーブル

| Column        | Type       | Options                        |
| ------------- | ------     | -----------                    |
| postal code   | integer    | null: false                    |
| prefectures   | string     | null: false                    |
| municipality  | string     | null: false                    |
| address       | string     | null: false                    |
| building name | string     | null: false                    |
| phone number  | integer    | null: false                    |
| purchase_id   | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase
