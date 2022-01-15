-- S-007: レシート明細のテーブル（receipt）から
-- 売上日（sales_ymd）、顧客ID（customer_id）、商品コード（product_cd）、売上金額（amount）の順に列を指定し、以下の条件を満たすデータを抽出せよ。

-- 顧客ID（customer_id）が"CS018205000001"
-- 売上金額（amount）が1,000以上2,000以下

SELECT 
	sales_ymd, customer_id, product_cd, amount
FROM 
	receipt
WHERE
	customer_id = 'CS018205000001'
AND
	amount BETWEEN 1000 and 2000;