-- S-004: レシート明細のテーブル（receipt）から
-- 売上日（sales_ymd）、顧客ID（customer_id）、商品コード（product_cd）、売上金額（amount）の順に列を指定し、
-- 以下の条件を満たすデータを抽出せよ。
-- 顧客ID（customer_id）が"CS018205000001"

SELECT receipt.sales_ymd, receipt.customer_id, receipt.product_cd, receipt.amount
FROM receipt
WHERE customer_id = 'CS018205000001';