-- S-013: 顧客テーブル（customer）から、ステータスコード（status_cd）の先頭がアルファベットのA〜Fで始まるデータを全項目抽出し、10件だけ表示せよ。

SELECT * FROM customer WHERE status_cd ~ '^[A-F]' LIMIT 10;