-- S-002: レシート明細のテーブル（receipt）から
-- 売上日（sales_ymd）、顧客ID（customer_id）、商品コード（product_cd）、売上金額（amount）の順に列を指定し、10件表示させよ。

SELECT receipt.sales_ymd, receipt.customer_id, receipt.product_cd, receipt.amount FROM receipt limit 10;