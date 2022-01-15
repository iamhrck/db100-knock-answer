-- S-036: レシート明細テーブル（receipt）と店舗テーブル（store）を内部結合し、
-- レシート明細テーブルの全項目と店舗テーブルの店舗名（store_name）を10件表示させよ

SELECT 
	r.*, s.store_name 	
FROM 
	receipt r 
INNER JOIN 
	store s
ON 
	r.store_cd = s.store_cd 
LIMIT 10;