## 0.2.0
- Ability to handle `id: :snowflake` in the table definition
- Stop creating indexes for `id` columns when using `id: :snowflake` in the table definition
- Stop supporting using `t.snowflake :id` in the table definition, force usage of `create_table :table_name, id: :snowflake` instead

## 0.1.2
- Automatically create indexes for snowflake columns when using the `t.snowflake` column method

## 0.1.1
- Add support for Rails 8.1

## 0.1.0
- Initial release
