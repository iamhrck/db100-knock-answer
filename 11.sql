-- S-011: 顧客テーブル（customer）から顧客ID（customer_id）の末尾が1のものだけ全項目抽出し、10件だけ表示せよ。
SELECT * FROM customer WHERE customer_id LIKE	'%1' LIMIT 10;