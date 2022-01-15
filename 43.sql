-- S-043: レシート明細テーブル（receipt）と顧客テーブル（customer）を結合し、性別（gender）と年代（ageから計算）ごとに売上金額（amount）を合計した売上サマリテーブル（sales_summary）を作成せよ。性別は0が男性、1が女性、9が不明を表すものとする。

-- ただし、項目構成は年代、女性の売上金額、男性の売上金額、性別不明の売上金額の4項目とすること（縦に年代、横に性別のクロス集計）。また、年代は10歳ごとの階級とすること。

DROP TABLE IF EXISTS sales_summary;

CREATE TABLE sales_summary as(
	WITH customer_ext as(
			SELECT 
				*
				, (CURRENT_DATE - birth_day) / 365 as age
				-- まず10で割って一の位を切り捨てて再度10掛けることで世代を導出
				, age / 10 * 10 as generation
			FROM customer
		)	
		SELECT
			generation
			, SUM( CASE WHEN gender_cd = '0' THEN amount ELSE 0 END)as men_amount
			, SUM( CASE WHEN gender_cd = '1' THEN amount ELSE 0 END)as women_amount
			, SUM( CASE WHEN gender_cd = '9' THEN amount ELSE 0 END)as ignore_amount
		FROM
			receipt r
		INNER JOIN
			customer_ext c
		ON
			r.customer_id = c.customer_id
		GROUP BY generation
		ORDER BY generation
);