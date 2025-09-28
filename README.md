# Credit_Risk_Analysis
## 1. Mục tiêu
Dự án này tập trung phân tích dữ liệu của khách hàng nhằm xác định **nhóm nhân tố ảnh hưởng đến khả năng phát sinh nợ xấu nghiêm trọng trong vòng 2 năm của khách hàng**.

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
- Làm sạch dữ liệu, xử lý missing values, outlier

### 4.2. Khám phá dữ liệu (EDA)
- Thống kê mô tả các biến  
- Visualize phân phối dữ liệu, kiểm tra các mối quan hệ cơ bản giữa các biến

### 4.3. Kiểm tra mức độ tác động
- 10 biến độc lập thuộc 03 nhóm (Nhân khẩu học, Hồ sơ tín dụng, Hành vi trả nợ) đến biến mục tiêu (khả năng phát sinh nợ xấu)
- Kiểm tra tỷ lệ nợ xấu theo từng nhóm của từng biến độc lập

### 5. Đánh giá kết quả
Phân tích 03 nhóm nhân tố chính (Nhân khẩu học, Hồ sơ tín dụng, Hành vi trả nợ) cho thấy bức tranh rủi ro tín dụng của tệp khách hàng. Kết quả phân tích cho thấy nhóm Nhân khẩu học và Hồ sơ tín dụng cung cấp thông tin nền, trong khi Hành vi trả nợ phản ánh trực tiếp và mạnh mẽ nhất đến khả năng phát sinh nợ xấu, cụ thể:
- **Nhóm Nhân khẩu học**: Khách hàng trẻ tuổi (<35), thu nhập thấp và có nhiều người phụ thuộc (3–4) là nhóm dễ phát sinh nợ xấu nhất, với tỷ lệ rủi ro lên tới khoảng 58–60%. Ngược lại, nhóm khách hàng lớn tuổi (50+) hoặc thu nhập rất cao có tỷ lệ nợ xấu thấp hơn (~40%).
- **Nhóm Hồ sơ tín dụng**: Rủi ro cao nhất tập trung ở khách hàng có rất ít tài khoản tín dụng mở (do thiếu lịch sử tín dụng), sử dụng hạn mức quá cao (>80%, rủi ro >75%), và có tỷ lệ nợ/thu nhập vượt 80%. Nhóm khách hàng có hồ sơ tín dụng đa dạng hơn, sử dụng hạn mức hợp lý (0–30%) và duy trì tỷ lệ nợ thấp (<50%) thường có khả năng trả nợ tốt hơn.
- **Nhóm Hành vi trả nợ**: Đây là nhân tố quan trọng nhất. Chỉ cần một lần trễ hạn đã làm tỷ lệ nợ xấu tăng vọt: ~70% cho trễ hạn 30–59 ngày, ~86% cho trễ hạn 60–89 ngày, và ~87% cho trễ hạn trên 90 ngày. Khi số lần trễ hạn tăng từ 2 lần trở lên, khả năng nợ xấu gần như chắc chắn (94–98%).

**Kết luận chung**: Khi kết hợp 03 nhóm nhân tổ trên cho thấy 
(i) Khách hàng trẻ, thu nhập thấp, nhiều người phụ thuộc, hồ sơ tín dụng hạn chế, sử dụng tín dụng vượt quá khả năng, và đặc biệt có lịch sử trễ hạn là những đối tượng có rủi ro nợ xấu cao nhất. 
(ii) Ngược lại, Khách hàng có thu nhập cao, lịch sử tín dụng ổn định, tỷ lệ nợ hợp lý và chưa từng trễ hạn thường an toàn hơn nhiều.

**Định hướng ứng dụng**: Các kết quả phân tích này có thể làm cơ sở lựa chọn biến cho mô hình chấm điểm tín dụng, đồng thời giúp ngân hàng thiết kế chính sách quản lý rủi ro phù hợp với từng nhóm khách hàng.



