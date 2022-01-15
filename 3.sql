-- S-003: レシート明細のテーブル（receipt）から
-- 売上日（sales_ymd）、顧客ID（customer_id）、商品コード（product_cd）、売上金額（amount）の順に列を指定し、10件表示させよ。
-- ただし、sales_ymdはsales_dateに項目名を変更しながら抽出すること。

SELECT receipt.sales_ymd as sales_date, receipt.customer_id, receipt.product_cd, receipt.amount
FROM receipt
LIMIT 10;