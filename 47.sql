-- S-047: レシート明細テーブル（receipt）の売上日（sales_ymd）はYYYYMMDD形式の数値型でデータを保有している。
-- これを日付型に変換し、レシート番号(receipt_no)、レシートサブ番号（receipt_sub_no）とともに抽出せよ。
-- データは10件を抽出すれば良い。

SELECT
	receipt_no 
	,receipt_sub_no
	,to_date(sales_ymd::TEXT, 'YYYYMMDD') as sales_date
FROM
	receipt
LIMIT 10


-- DBのvarchar・text・charの違い
-- 厳密な違いはない
-- varcharは文字数指定ができる
-- textは文字数指定という概念はない
-- varcharはDBの容量の見積もりができるという点でメリットは有る
