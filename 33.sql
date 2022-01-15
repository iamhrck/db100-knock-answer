-- S-033: レシート明細テーブル（receipt）に対し、店舗コード（store_cd）ごとに
-- 売上金額（amount）の平均を計算し、330以上のものを抽出せよ。

SELECT
	store_cd, AVG(amount)
FROM
	receipt
GROUP by store_cd
HAVING AVG(amount) >= 330;