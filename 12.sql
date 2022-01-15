-- S-012: 店舗テーブル（store）から横浜市の店舗だけ全項目表示せよ。
SELECT * FROM store WHERE address LIKE '%横浜市%';