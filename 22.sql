-- S-022: レシート明細テーブル（receipt）の顧客ID（customer_id）に対し、ユニーク件数をカウントせよ。

SELECT COUNT(DISTINCT customer_id) FROM receipt;