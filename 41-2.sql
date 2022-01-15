-- S-041: レシート明細テーブル（receipt）の売上金額（amount）を日付（sales_ymd）ごとに集計し、
-- 前日からの売上金額増減を計算せよ。
-- なお、計算結果は10件表示すればよい。

WITH amount_today as (
	SELECT
		sales_ymd,
		-- 対象行（当日）の売上金額合計
		SUM(amount)as amount_today,
		-- 対象行の前の行（前日）の売上金額合計
		(LAG(SUM(amount)) OVER())as amount_yesterday
	FROM
		receipt
	GROUP BY sales_ymd
	ORDER BY sales_ymd asc
	LIMIT 10
)

SELECT
	sales_ymd,
	-- 前日からの売上増減
	-- 初日は比較対象がないため0とする
	COALESCE((amount_today - amount_yesterday), 0)as diff
FROM
	amount_today;