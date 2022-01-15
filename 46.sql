-- S-046: 顧客テーブル（customer）の申し込み日（application_date）はYYYYMMDD形式の文字列型でデータを保有している。
--これを日付型に変換し、顧客ID（customer_id）とともに抽出せよ。データは10件を抽出すれば良い。

SELECT
	customer_id, to_date(application_date, 'YYYYMMDD')
FROM
	customer
LIMIT 10;