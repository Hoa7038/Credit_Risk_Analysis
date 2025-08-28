# Credit_Risk_Analysis
## 1. Mục tiêu
Dự án này tập trung phân tích **tác động của các nhân tố đến khả năng phát sinh nợ xấu nghiêm trọng trong vòng 2 năm** của khách hàng, nhằm rút ra **insights** về các **yếu tố ảnh hưởng đến rủi ro tín dụng**.

## 2. Mô tả biến
| STT | Tên biến | Ý nghĩa |
|------|---------|-----|
| 1 | `age` | Tuổi của khách hàng vay (tính theo năm) |
| 2 | `monthly_inc` | Thu nhập trước thuế của khách hàng vay (tính theo tháng)|
| 3 | `dependents` | Số lượng người phụ thuộc của khách hàng |
| 4 | `open_credit` | Số lượng khoản vay trả góp và hạn mức tín dụng quay vòng (ví dụ: thẻ tín dụng) mà khách hàng đang sở hữu|
| 5 | `real_estate` | Số lượng khoản vay hoặc hạn mức tín dụng liên quan đến bất động sản mà khách hàng đang có|
| 6 | `rev_util` |  Tỷ lệ sử dụng tín dụng quay vòng (số dư/tổng hạn mức tín dụng)|
| 7 | `debt_ratio` | Tỷ lệ nợ trên thu nhập (hoặc tài sản)|
| 8 | `late_30_59` | Số lần thanh toán chậm từ 30–59 ngày|
| 9 | `late_60_89` | Số lần thanh toán chậm từ 60–89 ngày|
| 10 | `late_90` | Số lần thanh toán chậm từ 90 ngày trở lên|
| 11 | `dlq_2yrs` | Biến mục tiêu/phụ thuộc cho biết khách hàng có phát sinh nợ xấu nghiêm trọng trong 2 năm tới hay không (0 = Không; 1 = Có) |

## 3. Công cụ sử dụng 
- **Python**: thống kê, phân tích, visualization
- **SQL**: xử lý dữ liệu
- **Power BI**: phân tích, visualization

## 4. Quá trình thực hiện
### 4.1. Thu thập và xử lý dữ liệu
- Thu thập dữ liệu từ Kaggle  
- Làm sạch dữ liệu, xử lý missing values, outlier, chuẩn hóa định dạng

### 4.2. Khám phá dữ liệu (EDA)
- Thống kê mô tả các biến  
- Visualize phân phối dữ liệu, kiểm tra các mối quan hệ cơ bản giữa các biến

### 4.3. Phân tích tác động
- Phân tích tác động của các nhóm biến độc lập đến biến phụ thuộc
- Phân tích tác động của từng biến độc lập đại diện mỗi nhóm đến biến phụ thuộc
- Phân tích tác động kết hợp của nhiều biến độc lập đến biến phụ thuộc

### 5. Đánh giá kết quả
- Trình bày, đánh giá các insight quan trọng

**Đang cập nhật…** sẽ bổ sung trước ngày 1/9/2025

