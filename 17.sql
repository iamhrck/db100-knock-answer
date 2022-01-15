-- S-017: 顧客テーブル（customer）を生年月日（birth_day）で高齢順にソートし、先頭10件を全項目表示せよ
-- ASCは省略可能
SELECT * FROM customer ORDER BY birth_day ASC LIMIT 10;