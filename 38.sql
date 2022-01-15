-- S-038: 顧客テーブル（customer）とレシート明細テーブル（receipt）から、各顧客ごとの売上金額合計を求めよ。
-- ただし、売上実績がない顧客については売上金額を0として表示させること。
-- また、顧客は性別コード（gender_cd）が女性（1）であるものを対象とし、非会員（顧客IDが"Z"から始まるもの）は除外すること。
-- なお、結果は10件だけ表示させれば良い。

-- レシート明細テーブルにて各顧客ごとの売上金額合計を求める
WITH sum_per_customer as (
	SELECT
		customer_id, SUM(amount)as sum_amount
	FROM
		receipt
	GROUP BY
		customer_id
)

-- WITH句の結果をcustomerと結合する
-- 顧客データの数はcustomer > receiptなので
-- customerで左外部結合をする

SELECT
	customer.customer_id, COALESCE(sum_amount, 0)
FROM
	customer
LEFT OUTER JOIN
	sum_per_customer
ON
	customer.customer_id = sum_per_customer.customer_id
WHERE
	customer.gender_cd = '1' and customer.customer_id NOT LIKE 'Z%'
LIMIT 10;