-- S-042: レシート明細テーブル（receipt）の売上金額（amount）を日付（sales_ymd）ごとに集計し、
-- 各日付のデータに対し、１日前、２日前、３日前のデータを結合せよ。結果は10件表示すればよい。

-- １日前、２日前、３日前のデータを列名として利用したいためWITH句を使う
WITH summary as (
	SELECT
		sales_ymd,
		SUM(amount) as total_today,
		LAG(SUM(amount), 1, 0) OVER() as yesterday,
		LAG(SUM(amount), 2, 0) OVER() as tow_days_ago,
		LAG(SUM(amount), 3, 0) OVER() as three_days_ago
	FROM
		receipt
	GROUP BY sales_ymd
	ORDER BY sales_ymd
	LIMIT 10
)


SELECT * FROM summary
WHERE 
	yesterday != 0
		AND
	tow_days_ago != 0
		AND
	three_days_ago != 0;

