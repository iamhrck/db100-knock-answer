-- S-015: 顧客テーブル（customer）から、
-- ステータスコード（status_cd）の
-- 先頭がアルファベットのA〜Fで始まり、
-- 末尾が数字の1〜9で終わるデータを全項目抽出し、10件だけ表示せよ。

-- 「.*」任意の一文字の　0回以上の繰り返し
SELECT * FROM customer WHERE status_cd ~ '^[A-F].*[1-9]$' LIMIT 10;