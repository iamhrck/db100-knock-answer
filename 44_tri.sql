SELECT * FROM sales_summary;
SELECT *, 0 as gender_cd FROM sales_summary;


WITH only_men as(
	SELECT
		generation, '0' as gender_cd, men_amount
	FROM
		sales_summary
), only_women as (
	SELECT
		generation, '1' as gender_cd, women_amount
	FROM
		sales_summary
), only_ignore as (
	SELECT
		generation, '9' as gender_cd, ignore_amount
	FROM
		sales_summary
)

SELECT * FROM only_men CROSS JOIN only_women

-- -- select文で一時的なテーブルを作成する
-- SELECT 0 AS gender_cd
-- UNION ALL
-- SELECT 1 AS gender_cd
-- UNION ALL
-- SELECT 9 AS gender_cd

-- cross joinは直積
WITH sales_summary_gender_cd as (
	SELECT * FROM sales_summary CROSS join 
		(
			SELECT 0 AS gender_cd
			UNION ALL
			SELECT 1 AS gender_cd
			UNION ALL
			SELECT 9 AS gender_cd
		) as temp
		ORDER BY generation, gender_cd
)

SELECT
	generation, gender_cd,
	(
		CASE 
			WHEN gender_cd = 0 THEN men_amount 
			WHEN gender_cd = 1 THEN women_amount
			ELSE ignore_amount 
		END
	) as amount
FROM sales_summary_gender_cd
ORDER BY gender_cd, generation;
