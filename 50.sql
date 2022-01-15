-- S-050: レシート明細テーブル（receipt）の売上エポック秒（sales_epoch）を日付型に変換し、「月」だけ取り出して
-- レシート番号(receipt_no)、レシートサブ番号（receipt_sub_no）とともに抽出せよ。
-- なお、「月」は0埋め2桁で取り出すこと。データは10件を抽出すれば良い。

SELECT
	receipt_no
	,receipt_sub_no
	,date_part('year', to_timestamp(sales_epoch))
FROM
	receipt
LIMIT 10;