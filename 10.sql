-- S-010: 店舗テーブル（store）から、店舗コード（store_cd）が"S14"で始まるものだけ全項目抽出し、10件だけ表示せよ。

SELECT * FROM store WHERE store_cd LIKE 'S14%' LIMIT 10;