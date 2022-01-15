-- S-053: 顧客テーブル（customer）の郵便番号（postal_cd）に対し、
-- 東京（先頭3桁が100〜209のもの）を1、それ以外のものを0に２値化せよ。

SELECT
	customer_id
	,postal_cd
	-- 特定の文字列を置き換える
	,(
		CASE
			WHEN REPLACE(postal_cd, '-', '')::int BETWEEN 1000000 and 2090000
			THEN 1
			ELSE 0
		END
	) as postal_type
FROM customer;

-- さらにレシート明細テーブル（receipt）と結合し、
-- 全期間において売上実績がある顧客数を、作成した2値ごとにカウントせよ。
WITH customer_ext as (
	SELECT
		*
		,(
			CASE
				-- 特定の文字列を置き換える
				WHEN REPLACE(postal_cd, '-', '')::int BETWEEN 1000000 and 2090000
				THEN 1
				ELSE 0
			END
		) as postal_type
	FROM customer
)
-- receiptテーブルにあるレコードはすべてamount > 0だが
-- 売上実績が複数ある顧客もいるためamountをSUMしたレコード数を対象とする
,receipt_distinct as (
	SELECT customer_id, SUM(amount) FROM receipt GROUP BY customer_id
)



SELECT
	-- 特定の条件をカウントする　or null必要
	COUNT (postal_type = 1 OR NULL) as oneone
	,COUNT (postal_type = 0 OR NULL) as zerozero
FROM customer_ext c
INNER JOIN receipt_distinct r
ON c.customer_id = r.customer_id;