-- S-023: レシート明細テーブル（receipt）に対し、店舗コード（store_cd）ごとに売上金額（amount）と売上数量（quantity）を合計せよ。

SELECT store_cd as 店舗コード, SUM(amount)as 売上金額, SUM(quantity) as 売上数量 FROM receipt GROUP BY store_cd;