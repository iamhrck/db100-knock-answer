-- S-020: レシート明細テーブル（receipt）に対し、1件あたりの売上金額（amount）が高い順にランクを付与し、先頭10件を抽出せよ。項目は顧客ID（customer_id）、売上金額（amount）、付与したランクを表示させること。なお、売上金額（amount）が等しい場合でも別順位を付与すること。

SELECT customer_id, amount, ROW_NUMBER() OVER(ORDER BY amount	DESC) as ranking FROM receipt LIMIT 10;