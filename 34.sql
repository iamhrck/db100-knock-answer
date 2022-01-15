-- S-034: レシート明細テーブル（receipt）に対し、
-- 顧客ID（customer_id）ごとに売上金額（amount）を合計して全顧客の平均を求めよ。
-- ただし、顧客IDが"Z"から始まるのものは非会員を表すため、除外して計算すること。

-- customer_idがZで始まらないものを抽出する
WITH without_nonofficial as (
	SELECT
		customer_id, SUM(amount) as totalAmount
	FROM
		receipt
	GROUP BY customer_id
	HAVING customer_id ~ '^(?!Z).*$'
)

SELECT
	AVG(totalAmount)
FROM
	without_nonofficial