# 學校資料管理系統

## 系統架構
![image](https://github.com/LinChiaEn/StudentDatabase/assets/93340978/a7ed8996-0ba6-4e22-ba2a-ab178f5c3193)
## 環境
android studio、visual studio code
## 語言
Dart

## 介面截圖與使用說明
從下拉式選單點選button，點選完畢則會自動跑出指令，若想手動輸入，擇點選SQLite
點選完畢或輸入完畢按下填寫完成即可跑出結果
insert、delete、update的結果會顯示在資料庫，其餘的查尋會直
接顯示在上面的結果欄位，並附加下面的資料庫資料以便檢查
查看完畢點選返回後即可重新進行查詢

## Query
![image](https://github.com/LinChiaEn/StudentDatabase/assets/93340978/0eedd3d2-d4fa-432a-949d-a01cdaac3299)

## Button
![image](https://github.com/LinChiaEn/StudentDatabase/assets/93340978/2c0b8cea-d02c-4bc5-9ce8-52cf6e9cbd22)

## ER diagram
1.一個班級由學生和老師組成
2.學生會參與學校活動
3.老師負責出考卷內容
4.學生需要考試填寫考卷
5.老師負責批改學生的考卷
![image](https://github.com/LinChiaEn/StudentDatabase/assets/93340978/ce4e9e51-88ad-443d-afba-0ed77a710a7f)

## Schema
1.學生
記錄學生的個人資料以及就讀班級
2.老師
紀錄老師的資料與教學科目
3.學校班級
紀錄班級的位置還有老師編號
4.活動
記錄學校的活動和時間地點以及參與年級
5.考卷分數
記錄每張考卷的分數、填寫考卷的學生和批
改考卷的老師
6.紅色代表primary key
![image](https://github.com/LinChiaEn/StudentDatabase/assets/93340978/74ece3e7-6a3b-4983-927f-732b9a42ea48)
