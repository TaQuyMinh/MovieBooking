# Project: Online movie ticket booking system.

## Group: HALM 
- Le Nguyen Hoang Anh
- Nguyen Chi Hao
- Luu Kien Lan
- Ta Quy Minh

## Purpose: 
- To serve the demand for online movie ticket purchases, making the ticket buying process faster and more convenient compared to traditional methods.


## Users: 
- Admin: the person who is responsible for managing and operating the activities of the website. The role of the admin includes content management, ensuring security, customer support, and tracking revenue.
- Customer: are individuals who buy tickets to watch movies at cinemas or through online platforms specializing in movie ticket sales.
- Guest: are customers who visit a website or platform but have not yet created an account or made a purchase.

## Features:
### For admin:
#### 1. Managing Movies and Showtimes:
- Add, edit, and delete movie information: Includes movie title, description, director, cast, genre, and duration.
- Set up movie schedules: Schedule movie times and dates at different theaters.
- Manage theaters: Add, edit, and delete theater information, including the number of screening rooms and seats in each room.

#### 2. Ticket Management:
- Set ticket prices: Determine ticket prices for different showtimes, including regular, VIP, and 3D tickets.
- Manage promotions and discounts: Create promotional programs, discounts, and discount codes for customers.
- Track revenue: Monitor the number of tickets sold and revenue from ticket sales.

#### 3. User Management:
- Manage user accounts: Add, edit, and delete user accounts.
- Customer support: Address issues, questions, and complaints from customers via email.

#### 4. Content Management:
- Update website information: Edit and update website content such as movie information, events, and blog posts.
- Manage images and videos: Upload and manage images, movie trailers, and other multimedia content.

#### 5. Reporting and Analysis:
- Revenue reports: Aggregate and analyze revenue from ticket sales by day, week, month, and year.
- Movie performance reports: Evaluate the performance of each movie based on the number of tickets sold and customer feedback.

### For customer:
#### 1. Browse Movies:
- View currently showing movies: Browse the list of movies currently showing in theaters.
- Watch trailers and view movie information: Watch trailers, read summaries, view information about directors, actors, and movie ratings.

#### 2. Booking Tickets:
- Select theater and showtime: Customers can choose a theater and showtime that fits their schedule.
- Select seats: View the seating chart and choose seats according to their preference (e.g., regular seats, VIP seats).
- Buy tickets online: Pay for tickets using various online payment methods such as credit cards, e-wallets, or bank transfers.

#### 3. Manage Personal Account:
- Register and log in: Create a new account or log in to an existing account to book tickets and manage personal information (name, date of birth, email, address, phone number).
- View purchase history: Review previously purchased tickets and details of past bookings (number of tickets, showtime, movie title, seat).
- Manage personal information: Update personal details such as name, email address, and phone number.

#### 4. Promotions and Discounts:
- Apply discount codes: Enter discount or promo codes when purchasing tickets to receive discounts.
- View promotional offers: Check current promotions and special offers available on the website.

#### 5. Customer Support:
-	Contact support: Customers can reach out to support through email to resolve issues or inquiries.

#### 6. Notifications:
- Receive notifications: Get notifications about new movies, promotional programs, and special events through the notification section.


### For guest:
#### 1. Browse Movies:
- View currently showing movies: Browse the list of movies currently showing in theaters.
- Watch trailers and view movie information: Watch trailers, read summaries, view information about directors, actors, and movie ratings.

#### 2. Promotions and Discounts:
- View promotional offers: Check current promotions and special offers available on the website. However, applying discount codes may require account login.

#### 3. Notifications:
- View general notifications: See public notifications about new movies, promotional programs, and special events.

#### 4. Customer Support:
- Contact support: Customers can reach out to support through emmail to resolve basic issues or inquiries. However, detailed personal support may require login.

#### 5. Register an Account:
- Register a new account: Customers can register a new account to access more comprehensive features, such as saving purchase history, receiving personalized notifications.

## Reference:
https://www.cgv.vn/

![](image/CGV.png)


## GUI:
### Trang chu:
![](GUI/trang-chu.jpg)

### Danh sach phim:
![](GUI/phim-dang-chieu.jpg)

### Danh sach rap:
![](GUI/danh-sach-rap.png)

### Dac trung cua HALM:
![](GUI/dac-trung-halm.png)

### Tin tuc / uu dai:
![](GUI/tin-tuc_uu-dai.png)

### Dang ky / dang nhap:
![](GUI/dang-ky_dang-nhap.png)

### Noi dung phim:
![](GUI/noi-dung-phim.jpg)

### Noi dung su kien:
![](GUI/noi-dung-su-kien.png)

### Tai khoan user:
![](GUI/tai-khoan-user.png)

### Mua ve:
![](GUI/mua-ve.png)


## ADMIN
### Dashboard:
![](GUI/Dashboard.jpg)

### Theatre
![](GUI/Theatre.jpg)

### Them theather:
![](GUI/Add%20Theatre.jpg)

### Edit theather:
![](GUI/Edit%20Theatre.jpg)

### Movie:
![](GUI/Movie.jpg)

### Them movie:
![](GUI/Add%20Movie.jpg)

### Edit movie:
![](GUI/Edit%20movie.jpg)

### Quan li User:
![](GUI/User.jpg)

### Quan li booking:
![](GUI/Booking.jpg)


## DATABASE MODEL:
![](GUI/ERD(chinhthuc).png)

## FILE DIAGRAM:
![](GUI/fileCode1.png)
![](GUI/fileCode2.png)
![](GUI/fileCode3.png)
![](GUI/fileCode4.png)

## FLOW DIAGRAM:
![](GUI/Flow.jpg)

## CONCLUSION:
### 1.	The pros and cons of your application:
#### Pros:
-	Tương đối hoàn thiện về các chức năng cơ bản của một web đặt vé xem phim online.
-	Hiệu suất hoạt động của phần lớn các trang đều rất nhanh.
-	Lấy chính xác các dữ liệu trong SQL.
-	Người dùng có thể đặt vé online; xem danh sách phim, rạp, tỉnh, sự kiện, lịch sử giao dịch; xem và chỉnh sửa thông tin cá nhân.
-	Admin có thể quản lý và chỉnh sửa các thông tin của web: danh sách phim, danh sách rạp, danh sách đặt vé; có thể thêm và cập nhật các thông tin 1 cách dễ dàng.
-	Đặt vé online sẽ chỉ hiển thị những ghế còn trống, sau khi chọn mua ghế, sẽ tự động cập nhật lại danh sách ghế còn trống.
-	Sau khi mua vé, sẽ tự động cập nhật số lượt xem mới cho phim vừa được mua.

#### Cons:
-	Trong phần thanh toán vẫn chưa thực hiện được việc quét mã QR để có thể chính thức thanh toán.
-	Chưa thực hiện được chức năng sử dụng mã giảm giá.
-	Khi nhấp vào nút “Vé của tôi” ở đầu trang chủ, đáng lẽ nó sẽ phải vào trực tiếp phần “Lịch sử giao dịch” nhưng tụi em vẫn chưa làm được, nó sẽ mặc định hiện lên trang thông tin cá nhân, mà không vào trực tiếp “Lịch sử giao dịch”.
-	Tương tự ở nút “Đăng ký ngay” trên thanh điều hướng, đáng lẽ phải vào trang login và chuyển sang phần “Đăng ký” nhưng tụi em chỉ làm được mặc định nó sẽ hiện vào phần “Đăng nhập” và phải click vào “Đăng ký”.
-	Trong phần Admin, tụi em vẫn chưa thực hiện các chức năng liên quan đến phần giao dịch như: tìm kiếm vé, sắp xếp vé, thống kê doanh thu, lợi nhuận. Tụi em đã bỏ xót phần “Event” nên người dùng sẽ không thêm được các sự kiện mới.

### 2. What you've learned during developing of your application:
-	Khi mới làm việc, hầu hết từ việc viết requitement, vẽ GUI đến vẽ ERD, tụi em vẫn chưa hình dung được tầm quan trọng của nó nên viết chưa đầy đủ và có nhiều sai sót, do đó, trong quá trình làm việc, tụi em phải liên tục cập nhật lại các yếu tố trên sao cho phù hợp với tiến độ làm việc. Sau 1 thời gian làm việc, tụi em nhận thấy những điều đó rất quan trọng, đặc biệt là ở phần ERD, cần phải được nghiên cứu 1 cách rõ ràng và chi tiết thì khi làm việc với dữ liệu mới dễ dàng và tiện lợi.
-	Tụi em học được cách làm việc nhóm qua GitHub, tuy có nhiều lỗi khi pull, push nhưng qua project này tụi em hiểu cách để không gây ra các lỗi đó và hiểu hơn cách làm sao để có thể trao đổi code qua GitHub, giúp cho quá trình code tiện lợi và nhanh chóng hơn.
-	Tụi em hiểu được cách 1 trang web hoạt động ra sao, những cú click sẽ có tác dụng gì, dữ liệu sẽ được truyền từ đâu sang đâu, và cách để các trang của 1 trang web kết nối với nhau như thế nào. Ngoài ra tụi em còn hiểu hơn về cách sử dụng dữ liệu trong SQL để đưa lên trang web, cách tổ chức dữ liệu cho từng chức năng của trang web. Cách để viết các câu truy xuất dữ liệu sao cho lượng thông tin tải lên phải chính xác với yêu cầu, không được dư thừa, vì nếu dữ liệu quá nhiều sẽ có thể làm cho trang web load rất chậm.
### 3. What would you improve your application in the future?
-	Đầu tiên là phần giảm giá và phần thanh toán bằng quét mã QR trong việc đặt vé.
-	Phần “Vé của tôi” và “Đăng ký ngay” khi click vào phải trỏ thẳng tới phần tương ứng của nó, điều đó giúp người dùng có trải nghiệm thoải mái hơn.
-	Trong phần Admin, tụi em sẽ thêm các chức năng tìm kiếm, sắp xếp để có thể dễ dàng thống kê các danh sách.
-	Thêm phần “Event’ trong Admin để có thể thêm sự kiện mới.



