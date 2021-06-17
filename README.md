## usersテーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| fullname           | string  | null: false |
| kana               | string  | null: false |
| born_id            | integer | null: false |

### Association

- has_many :items
- has_one :address

## itemsテーブル

| Column             | Type    | Options                        |
| ------------------ | ------- | ------------------------------ |
| item_name          | string  | null: false                    |
| text               | text    | null: false                    |
| category_id        | integer | null: false                    |
| item_status_id     | integer | null: false                    |
| delivery_fee_id    | integer | null: false                    |
| prefecture_id      | integer | null: false                    |
| delivery_period_id | integer | null: false                    |
| price              | integer | null: false                    |
| user_id            | integer | null: false, foreign_key: true |

### Association

- belongs_to :user

## ActiveStrageテーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| image  | string | null: false |

## addressesテーブル

| Column        | Type    | Options                        |
| ------------- | ------- | ------------------------------ |
| postal_code   | integer | null: false                    |
| prefecture_id | integer | null: false                    |
| city          | string  | null: false                    |
| address       | integer | null: false                    |
| building_name | string  |                                |
| phone_number  | integer | null: false                    |
| user_id       | integer | null: false, foreign_key: true |

### Association

- belongs_to :user