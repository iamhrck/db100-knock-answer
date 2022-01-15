-- S-048: レシート明細テーブル（receipt）の売上エポック秒（sales_epoch）は数値型のUNIX秒でデータを保有している。
-- これを日付型に変換し、レシート番号(receipt_no)、レシートサブ番号（receipt_sub_no）とともに抽出せよ。
-- データは10件を抽出すれば良い。

SELECT
	receipt_no
	,receipt_sub_no
	-- UNIX秒をtimestamp型に変換する
	,to_timestamp(sales_epoch)
	-- timestamp型をvarcharに変換する
	,to_char(to_timestamp(sales_epoch), 'YYYYMMDD')
	-- varchar型をDate型に変換する
	,to_date(to_char(to_timestamp(sales_epoch), 'YYYYMMDD'), 'YYYYMMDD')
FROM
	receipt	