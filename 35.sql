-- S-035: レシート明細テーブル（receipt）に対し、
-- 顧客ID（customer_id）ごとに売上金額（amount）を合計して全顧客の平均を求め、平均以上に買い物をしている顧客を抽出せよ。
-- ただし、顧客IDが"Z"から始まるのものは非会員を表すため、除外して計算すること。
-- なお、データは10件だけ表示させれば良い。

WITH per_customer_amount as(
  SELECT
  	customer_id, SUM(amount)as sum_amount 
  FROM receipt 
  WHERE customer_id NOT LIKE 'Z%' 
  GROUP BY customer_id
)

SELECT
	*
FROM 
per_customer_amount 
WHERE sum_amount >= (SELECT AVG(sum_amount) FROM per_customer_amount)
LIMIT 10;