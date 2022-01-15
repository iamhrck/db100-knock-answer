-- S-045: 顧客テーブル（customer）の生年月日（birth_day）は日付型でデータを保有している。
-- これをYYYYMMDD形式の文字列に変換し、顧客ID（customer_id）とともに抽出せよ。データは10件を抽出すれば良い。

SELECT
	customer_id, to_char(birth_day, 'YYYYMMDD')
FROM
	customer
LIMIT 10;