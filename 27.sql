-- S-027: レシート明細テーブル（receipt）に対し、店舗コード（store_cd）ごとに売上金額（amount）の平均を計算し、降順でTOP5を表示せよ。

SELECT store_cd, COUNT(store_cd),AVG(amount) FROM receipt GROUP BY store_cd ORDER BY AVG(amount) DESC LIMIT 5;