create database BTL_VTJob;
use BTL_VTJob

Create table Nguoidung(
UserID int IDENTITY primary Key,
Hoten nvarchar(50)  NOT NULL,
MatKhau varchar(20) NOT NULL,
SoDT nvarchar(10) ,
Email varchar(50) NOT NULL UNIQUE, 
Quyen VARCHAR(10) NOT NULL CHECK (Quyen IN('Admin', 'Management', 'User')),

)


create table DoanhNghiep(
Id int IDENTITY primary Key,
TenCT nvarchar(200) null,
Mota ntext null,
DiaChi nvarchar(150) null,
Anh varchar(max),
UserID int,
FOREIGN KEY (UserID) REFERENCES NguoiDung(UserID)
 )

create table LoaiJob (
Id int primary key IDENTITY,
TenLoaiJob nvarchar(100)
)

Create TABLE BaiTuyenDung(
MaBai varchar (10) primary Key,
TieuDe nvarchar(250),
MucLuong varchar(50) ,
SoLuongTuyen int,
MoTaCV nTEXT,
YeuCau nText,
QuyenLoi nText ,
NgayDang Date ,
HanNopCV Date,
IdDoanhNghiep int,
IdLoaiJob int ,
FOREIGN KEY (IdLoaiJob) REFERENCES LoaiJob(Id),
FOREIGN KEY (IdDoanhNghiep) REFERENCES DoanhNghiep(Id)

)

Create TABLE CVUngTuyen(
MaCV varchar (10) primary Key,
CV Text,
MaBai varchar(10),
UserID int,
FOREIGN KEY (UserID) REFERENCES NguoiDung(UserID),
FOREIGN KEY (MaBai) REFERENCES BaiTuyenDung(MaBai)
)
Alter table CVUngTuyen
Add BaiTuyenDungMaBai nvarchar(10)null;

Alter table CVUngTuyen
Add NguoiDungUserID int null;

insert into LoaiJob(TenLoaiJob
)
values
(N'IT'),
(N'Ngôn ngữ'),
(N'Tư vấn'),
(N'Nhân sự');

insert into Nguoidung(
Hoten ,
Email ,
SoDT,
MatKhau,
Quyen)
values
(N'Tạ Minh Vượng','taminhvuong160101@gmail.com','0987654321','12345','Admin'),
(N'Nguyễn Minh Tuyên','adimn@gmail.com','12345','0123456789','Management');

insert into DoanhNghiep(
TenCT,
Mota,
DiaChi ,
Anh
,UserID)
values
(N'Công Ty TNHH Thương Mại Và Phát Triển Nhân Lực Miền Tây (MITACO)',
N'Lĩnh vực hoạt động
1. Lĩnh vực giáo dục & đào tạo
Đào tạo tiếng Nhật & giáo dục định hướng nghề cho học sinh, sinh viên và người lao động. Phổ biến kiến thức về văn hoá, các qui định pháp luật và các cách thức giao tiếp trong cuộc sống hằng ngày tại Nhật Bản.
2. Lĩnh vực tư vấn Du học Nhật Bản
Tư vấn và thực hiện thủ tục hồ sơ du học sinh sang Nhật học tập tại các trường Nhật ngữ, Cao Đẳng và Đại Học uy tín.
3. Lĩnh vực XKLĐ
Phái cử thực tập sinh & kỹ sư, kỹ năng đặc định sang Nhật làm việc theo các chương trình Thực tập sinh, Kỹ năng đặc định và Kỹ sư theo đúng yêu cầu của nhà tuyển dụng tại Nhật Bản trong khuôn khổ luật pháp hiện hành của nước sở tại.
4. Lĩnh vực tư vấn và giới thiệu việc làm trong nước
Giới thiệu việc làm cho người lao động tại các công ty, xí nghiệp và nhà máy của Nhật Bản tại Việt Nam.
Các văn phòng, trung tâm và chi nhánh
Thành phố Vĩnh Long
+ Văn phòng tư vấn: 62 Nguyễn Huệ, P. 2, TP. Vĩnh Long, Tỉnh Vĩnh Long

+ Trung tâm đào tạo & Văn phòng tư vấn tuyển sinh: Trường Cao Đẳng Vĩnh Long, Cổng C

+ Trung tâm Nhật ngữ Mitaco

Thành phố Trà Vinh
+ Trung tâm đào tạo & Văn phòng tư vấn tuyển sinh: Trường Cao Đẳng Nghề Trà Vinh, Ấp Vĩnh Yên, Xã Long Đức, TP. Trà Vinh

Thành phố Hồ Chí Minh
+ Văn phòng tư vấn – Trung tâm đào tạo và tư vấn tuyển sinh: 21 Trần Thị Nghỉ, Phường 7, Quận Gò Vấp, TP. Hồ Chí Minh',N'21 Trần Thị Nghỉ, Phường 7, Quận Gò Vấp, Thành Phố Hồ Chí Minh',
'images.jpg',2);


insert into BaiTuyenDung(
MaBai ,
TieuDe,

MucLuong ,
SoLuongTuyen ,
MoTaCV ,
YeuCau ,
QuyenLoi ,
NgayDang  ,
HanNopCV ,
IdDoanhNghiep ,
IdLoaiJob
)
values
('MB01_US01',N'Nhân Viên Đối Ngoại Tiếng Nhật Lương','10000000-15000000 vnđ',3,N'- Làm các Hồ sơ liên quan Thực tập sinh/Học viên đi Nhật của công ty.

- Chăm sóc, nuôi dưỡng duy trì quan hệ lâu dài với khách hàng của công ty.

- Đối ứng các công việc liên quan tới Thực tập sinh.

- Chăm sóc, đón tiếp các nghiệp đoàn, khách hàng công ty khi qua Việt Nam công tác.

- Dịch phỏng vấn; dịch CV của các Thực tập sinh.

- Hướng dẫn xuất cảnh, đưa các bạn đi xuất cảnh.

- Chịu trách nhiệm báo cáo trước quản lý, Giám đốc các công việc được giao.

- Liên hệ với các công ty, nghiệp đoàn tại Nhật để mang về những đơn hàng tuyển TTS.

- Các công việc khác theo sự chỉ đạo của Giám đốc.',N'- Nam/nữ (27 tuổi trở lên): ưu tiên tốt nghiệp chuyên ngành về Kinh tế, Quản trị kinh doanh, …

- Năng lực tiếng Nhật có chứng chỉ JLPT N2. (Nếu mới đạt trình độ tiếng Nhật N3 thì phải có kỹ năng giao tiếp tốt)

- Có hiểu biết về đất nước và con người Nhật Bản (ưu tiên ứng viên đã từng học tập, làm việc tại Nhật Bản hoặc làm việc cho các doanh nghiệp Nhật).

- Kỹ năng giao tiếp, đàm phán, thuyết trình,có kỹ năng quản lý và giải quyết vấn đề. Nhạy bén với các cơ hội kinh doanh, có kiến thức chuyên sâu về ngành xuất khẩu lao động.

- Có khả năng tự thúc đẩy, tự vạch định mục tiêu cụ thể và tập trung thực hiện mục tiêu. Kiên trì, trung thực, chịu khó, trách nhiệm, độc lập cao. Có mục tiêu và định hướng công việc rõ ràng.

- Cởi mở, sẵn sàng học hỏi, tiếp thu các góp ý phản hồi.',N'- Lương cứng: 10 - 15 triệu + thưởng

- Đầy đủ các chế độ bảo hiểm theo quy định của pháp luật khi ký hợp đồng chính thức (BHXH, phép năm, thâm niên…).

- Đào tạo và phát triển: Đề cử tham dự các khóa đào tạo nâng cao trình độ nghiệp vụ, kỹ năng mềm nội bộ và ngoài Công ty.

- Lương thưởng vào các dịp lễ, tết trong năm. Tăng lương theo định kỳ hàng năm.

- Cấp phát đồng phục theo quy định.

- Tham gia các chương trình team building, nghỉ dưỡng hàng năm.','2023-7-14','2023-8-14',1,2);

insert into BaiTuyenDung(
MaBai ,
TieuDe,
MucLuong ,
SoLuongTuyen ,
MoTaCV ,
YeuCau ,
QuyenLoi ,
NgayDang  ,
HanNopCV ,
IdDoanhNghiep ,
IdLoaiJob
)
values('MB02', N'Senior Backend Dev', N'50000000 VND', 3, N'- Nghiên cứu và phát triển các sản phẩm phần mềm trong lĩnh vực An ninh mạng (thực hiện giám sát và phát hiện tấn công; quản lý ATTT cho tổ chức/doanh nghiệp).
'+'\r\n'+N'- Làm việc với team phát triển phần mềm tiếp nhận, phân tích và tạo ra các thiết kế/kiến trúc mới hướng đến quy mô và hiệu suất.
'+'\r\n'+N'- Thực hiện tối ưu về mặt kiến trúc hiệu năng cho các hệ thống lớn.
'+'\r\n'+N'- Nghiên cứu, áp dụng các công nghệ mới vào phát triển sản phẩm (microservice, cloud native, CI/CD)
'+'\r\n'+N'- Làm việc theo mô hình Agile-Scrum.
'+'\r\n'+N'- Có cơ hội tham gia xử lý các bài toán mới, khó như: Scalable, High-performance, Real-time Processing...', N'- Tốt nghiệp Đại học chính quy loại Khá trở lên chuyên ngành: Công nghệ thông tin, Khoa học máy tính, Toán - Tin, Điện tử viễn thông,... hoặc các chuyên ngành kỹ thuật khác liên quan.
'+'\r\n'+N'- Trình độ tiếng Anh tương đương tối thiểu 550 TOEIC.
'+'\r\n'+N'- Từ 3 năm kinh nghiệm lập trình backend.
'+'\r\n'+N'- Có kiến thức sâu về Golang, Python, NodeJS, Java, C# hoặc các ngôn ngữ BE tương đương khác.
'+'\r\n'+N'- Có kiến thức về OOP, microservices, Design pattern và thiết kế hệ thống.
'+'\r\n'+N'- Có kinh nghiệm tối ưu hệ thống hoặc tham gia phát triển dự án lớn, số lượng người dùng đáng kể. Biết sử dụng công nghệ Database (SQL, NoSQL), Redis, Message Queue (Kafka, RabbitMQ), các công cụ DevOps (Docker, Docker Compose, K8s)', 
N'- Đầy đủ các chế độ bảo hiểm theo quy định của pháp luật khi ký hợp đồng chính thức (BHXH, phép năm, thâm niên…).
- Đào tạo và phát triển: Đề cử tham dự các khóa đào tạo nâng cao trình độ nghiệp vụ, kỹ năng mềm nội bộ và ngoài Công ty.
- Lương thưởng vào các dịp lễ, tết trong năm. Tăng lương theo định kỳ hàng năm.
- Cấp phát đồng phục theo quy định.
- Tham gia các chương trình team building, nghỉ dưỡng hàng năm.', '2023-10-10', '2023-12-31', 1, 1), 

('MB03', N'Trợ Lý Tiếng Trung', N'15000000VND', 1, N'- Soạn thảo báo giá, hợp đồng, nhận đơn từ khách hàng và theo dõi giao hàng
'+'\r\n'+N'- Trợ lý cho giám đốc kinh doanh
'+'\r\n'+N'- Phụ trách kênh khách hàng đại lý, duy trì mối quan hệ tốt với khách hàng ( thăm viếng trực tiếp và gọi điện thoại)
'+'\r\n'+N'- Làm báo cáo hàng tuần, hàng tháng gửi về công ty mẹ ở Đài Loan
'+'\r\n'+N'- Đi công tác trong nước nếu có.', N'- Không yêu cầu kinh nghiệm (ưu tiên sinh viên mới ra trường) miễn l thái độ tốt và biết tiếng trung 4 kỹ năng.
'+'\r\n'+N'- Tốt nghiệp Trung cấp trở lên
'+'\r\n'+N'- Tiếng Trung thành thạo (4 kỹ năng)
'+'\r\n'+N'- Vi tính văn phòng
'+'\r\n'+N'- Có khả năng giao tiếp, trình bày, đàm phán và thuyết phục tốt. bằng tiếng Trung
'+'\r\n'+N'- Kỹ năng giải quyết vấn đề', N'- Lương cứng: 10 - 15 triệu + thưởng

- Đầy đủ các chế độ bảo hiểm theo quy định của pháp luật khi ký hợp đồng chính thức (BHXH, phép năm, thâm niên…).

- Đào tạo và phát triển: Đề cử tham dự các khóa đào tạo nâng cao trình độ nghiệp vụ, kỹ năng mềm nội bộ và ngoài Công ty.

- Lương thưởng vào các dịp lễ, tết trong năm. Tăng lương theo định kỳ hàng năm.

- Cấp phát đồng phục theo quy định.

- Tham gia các chương trình team building, nghỉ dưỡng hàng năm.', '2023-11-01', '2023-12-20', 1, 2);

select* from BaiTuyenDung;