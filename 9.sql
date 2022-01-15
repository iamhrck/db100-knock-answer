-- S-009: 以下の処理において、出力結果を変えずにORをANDに書き換えよ。

-- select * from store where not (prefecture_cd = '13' or floor_area > 900)

SELECT * FROM store WHERE prefecture_cd != '13' AND floor_area <= 900;