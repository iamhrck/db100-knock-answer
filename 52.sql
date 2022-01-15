-- S-052: レシート明細テーブル（receipt）の売上金額（amount）を顧客ID（customer_id）ごとに合計の上、
-- 売上金額合計に対して2,000円以下を0、2,000円より大きい金額を1に2値化し、
-- 顧客ID、売上金額合計とともに10件表示せよ。
-- ただし、顧客IDが"Z"から始まるのものは非会員を表すため、除外して計算すること。

SELECT
	customer_id,
	SUM(amount),
	CASE
		WHEN SUM(amount) <= 2000
		THEN 0
		ELSE 1
	END
FROM
	receipt
WHERE customer_id NOT LIKE 'Z%'
GROUP BY customer_id
LIMIT 10;