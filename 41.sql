-- S-041: レシート明細テーブル（receipt）の売上金額（amount）を日付（sales_ymd）ごとに集計し、
-- 前日からの売上金額増減を計算せよ。
-- なお、計算結果は10件表示すればよい。

SELECT 
	sales_ymd as today,
	(to_date(sales_ymd::TEXT, 'YYYYMMDD') + 1) as tomorrow,
	SUM(amount) as amout_today
FROM receipt
GROUP BY sales_ymd
ORDER BY sales_ymd;

WITH sales_today as (
	SELECT
		sales_ymd as today,
		SUM(amount) as amout_today
	FROM receipt
	GROUP BY sales_ymd
	ORDER BY sales_ymd
), sales_tomorrow as (
	SELECT
		(to_date(sales_ymd::TEXT, 'YYYYMMDD') + 1) as tomorrow,
		SUM(amount) as amout_yestoday
	FROM receipt
	GROUP BY tomorrow
	ORDER BY tomorrow
)

SELECT
	sales_today.today,
	(sales_today.amout_today - sales_tomorrow.amout_yestoday)as diff
FROM
 sales_today 
INNER JOIN
 sales_tomorrow 
ON
	sales_today.today = to_char(sales_tomorrow.tomorrow, 'YYYYMMDD')::int
LIMIT 10;