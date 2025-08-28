--2. Xử lý các giá trị outlier
---2.1. Tạo bảng
CREATE TABLE credit_risk (
    rev_util	DECIMAL(18,2),
    age	INT,
    late_30_59 INT,
    debt_ratio	DECIMAL(18,2),
    monthly_inc	INT,
    open_credit	INT,
    late_90	INT,
    real_estate	INT,
    late_60_89	INT,
    dependents	INT,
    dlq_2yrs INT
)
---2.2. Import file dữ liệu vào bảng tại 2.1
FROM 'E:/2. Project/Data/credit_risk.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);
---2.2. Xác định giá trị outlier cho 2 biến rev_util và debt_ratio
----Biến rev_util
SELECT COUNT(*) AS rev_outlier
FROM credit_risk
WHERE rev_util > 1;
----Biến debt_ratio
SELECT COUNT(*) AS debt_outlier
FROM credit_risk
WHERE debt_ratio > 1;

---2.3. Xác định tác động của các giá trị oulier đến dlq_2yrs
----Biến rev_uti
SELECT 
    CASE WHEN rev_util > 1 THEN 'rev > 1' ELSE 'rev <= 1' END AS debt_group,
    COUNT(*) AS total_obs,
    SUM(CASE WHEN dlq_2yrs = 1 THEN 1 ELSE 0 END) AS dlq_count,
    1.0 * SUM(CASE WHEN dlq_2yrs = 1 THEN 1 ELSE 0 END) / COUNT(*) AS dlq_rate
FROM credit_risk
GROUP BY CASE WHEN rev_util > 1 THEN 'rev > 1' ELSE 'rev <= 1' END;
----Biến debt_ratio
SELECT 
    CASE WHEN debt_ratio > 1 THEN 'debt > 1' ELSE 'debt <= 1' END AS debt_group,
    COUNT(*) AS total_obs,
    SUM(CASE WHEN dlq_2yrs = 1 THEN 1 ELSE 0 END) AS dlq_count,
    1.0 * SUM(CASE WHEN dlq_2yrs = 1 THEN 1 ELSE 0 END) / COUNT(*) AS dlq_rate
FROM credit_risk
GROUP BY CASE WHEN debt_ratio > 1 THEN 'debt > 1' ELSE 'debt <= 1' END;

----Ma trận mô tả các giá trị outlier của 02 biến
SELECT 
    CASE WHEN debt_ratio > 1 THEN 'debt > 1' ELSE 'debt <= 1' END AS debt_group,
    CASE WHEN rev_util > 1 THEN 'rev > 1' ELSE 'rev <= 1' END AS rev_group,
    COUNT(*) AS total_obs,
    SUM(CASE WHEN dlq_2yrs = 1 THEN 1 ELSE 0 END) AS dlq_count,
    1.0 * SUM(CASE WHEN dlq_2yrs = 1 THEN 1 ELSE 0 END) / COUNT(*) AS dlq_rate
FROM credit_risk
GROUP BY 
    CASE WHEN debt_ratio > 1 THEN 'debt > 1' ELSE 'debt <= 1' END,
    CASE WHEN rev_util > 1 THEN 'rev > 1' ELSE 'rev <= 1' END;

---2.4. Thay các giá trị outlier của 02 biến về 1
----Tạo 02 cột mới chứa các giá trị của 02 biến sau khi thay
ALTER TABLE credit_risk ADD debt_ratio_capped FLOAT;
ALTER TABLE credit_risk ADD rev_util_capped FLOAT;
----Cập nhật giá trị capped = 1 cho các giá trị bị outlier
UPDATE credit_risk
SET debt_ratio_capped = CASE WHEN debt_ratio > 1 THEN 1 ELSE debt_ratio END,
    rev_util_capped = CASE WHEN rev_util > 1 THEN 1 ELSE rev_util END;

---2.5. Kiem tra lại giữ liệu sau khi thay các giá trị outlier bằng 1
SELECT 
    CASE WHEN debt_ratio_capped > 1 THEN 'debt_capp > 1' ELSE 'debt_capp <= 1' END AS debt_capp_group,
    CASE WHEN rev_util_capped > 1 THEN 'rev_capp > 1' ELSE 'rev_capp <= 1' END AS rev_capp_group,
    COUNT(*) AS total_obs,
    SUM(CASE WHEN dlq_2yrs = 1 THEN 1 ELSE 0 END) AS dlq_count,
    1.0 * SUM(CASE WHEN dlq_2yrs = 1 THEN 1 ELSE 0 END) / COUNT(*) AS dlq_rate
FROM credit_risk
GROUP BY 
    CASE WHEN debt_ratio_capped > 1 THEN 'debt_capp > 1' ELSE 'debt_capp <= 1' END,
    CASE WHEN rev_util_capped > 1 THEN 'rev_capp > 1' ELSE 'rev_capp <= 1' END;

---2.6. Xuất file kết quả mới để upload và thực hiện trên Python
SELECT *
FROM credit_risk;

