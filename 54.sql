-- S-054: 顧客テーブル（customer）の住所（address）は、埼玉県、千葉県、東京都、神奈川県のいずれかとなっている。
-- 都道府県毎にコード値を作成し、顧客ID、住所とともに抽出せよ。
-- 値は埼玉県を11、千葉県を12、東京都を13、神奈川県を14とすること。
-- 結果は10件表示させれば良い。

SELECT 
	customer_id
	, address
	,(
		CASE
			WHEN address LIKE '%埼玉県%' THEN 11
			WHEN address LIKE '%千葉県%' THEN 12
			WHEN address LIKE '%東京都%' THEN 13
			WHEN address LIKE '%神奈川県%' THEN 14
			ELSE 0
		END
	)as prefecture_code
FROM customer
LIMIT 10;
