## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_kana        | string | null: false               |
| first_kana         | string | null: false               |
| born_id            | date   | null: false               |

### Association

- has_many :items

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

## buyersテーブル

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| user_id | integer | null: false, foreign_key: true |
| item_id | integer | null: false, foreign_key: true |

### Association

- has_one :address

## addressesテーブル

| Column        | Type    | Options                        |
| ------------- | ------- | ------------------------------ |
| postal_code   | string  | null: false                    |
| prefecture_id | integer | null: false                    |
| city          | string  | null: false                    |
| house_number  | string  | null: false                    |
| building_name | string  |                                |
| phone_number  | string  | null: false                    |
| user_id       | integer | null: false, foreign_key: true |

### Association

- belongs_to :buyer