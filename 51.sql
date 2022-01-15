-- S-051: レシート明細テーブル（receipt）の売上エポック秒を日付型に変換し、「日」だけ取り出して
-- レシート番号(receipt_no)、レシートサブ番号（receipt_sub_no）とともに抽出せよ。
-- なお、「日」は0埋め2桁で取り出すこと。データは10件を抽出すれば良い。

SELECT
	receipt_no
	, receipt_sub_no
	-- 0埋めする
	CASE
		WHEN date_part('day', to_timestamp(sales_epoch)) < 10
		THEN to_char(date_part('day', to_timestamp(sales_epoch)), '00')
		ELSE date_part('day', to_timestamp(sales_epoch))::text
	END
FROM
	receipt
LIMIT 10;


-- 以下メモ
SELECT
	-- 対象の文字列の左側に0を付けて0埋めする
	-- lpad(対象の文字列, 変換後の文字数, 付与する値)
	lpad(receipt_no::text, 5, '0')
FROM receipt;