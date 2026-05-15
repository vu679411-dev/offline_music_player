# Offline Music Player - Flutter Project (Lab 05)

LINK VIDEO DEMO:
https://drive.google.com/drive/u/2/folders/1YIJKL8c5ZA9aftZAkE7aGta2FfGzKtc5

ẢNH MINH HỌA:

<img width="552" height="890" alt="image" src="https://github.com/user-attachments/assets/f33385ad-d834-4863-b47b-ad2638d349f0" />
<img width="643" height="829" alt="image" src="https://github.com/user-attachments/assets/cd34553e-fe8f-425d-b850-9f6f0f7a5de8" />
<img width="572" height="868" alt="image" src="https://github.com/user-attachments/assets/20a37171-64e7-4ab1-8f31-03a5b8536446" />
<img width="525" height="844" alt="image" src="https://github.com/user-attachments/assets/716cdd91-aa79-446f-8214-0a1299d1f7f1" />


Một ứng dụng nghe nhạc Offline hoàn chỉnh được xây dựng bằng Flutter, cho phép người dùng quản lý và phát các tệp âm thanh trực tiếp từ bộ nhớ thiết bị.

##  Tính năng chính

- **Thư viện nhạc:** Tự động quét và hiển thị toàn bộ bài hát (.mp3, .m4a,...) có trong thiết bị.
- **Trình phát nhạc chuyên nghiệp:** Đầy đủ các nút điều khiển Play, Pause, Next, Previous, Shuffle (phát ngẫu nhiên) và Repeat (lặp lại).
- **Quản lý Playlist:** Tạo, xóa và quản lý danh sách phát cá nhân.
- **Phát nhạc chạy nền:** Nhạc vẫn tiếp tục phát khi ứng dụng ở chế độ nền (background).
- **Điều chỉnh âm lượng:** Tích hợp thanh trượt Volume ngay trong màn hình Now Playing.
- **Giao diện hiện đại:** Thiết kế theo phong cách Spotify với Dark Theme và Green Accent.
- **Lưu trữ trạng thái:** Ghi nhớ cài đặt Shuffle, Repeat và bài hát cuối cùng được phát.

##  Hướng dẫn cài đặt

### 1. Yêu cầu hệ thống
- Flutter SDK: `^3.0.0`
- Android Studio / VS Code
- Thiết bị Android (Thật hoặc Máy ảo)

### 2. Các bước thiết lập
```bash
# Clone project hoặc tải về
cd offline_music_player

# Cài đặt thư viện
flutter pub get

# Chạy ứng dụng
flutter run
```

##  Cấu trúc dự án (Project Structure)
Dự án tuân thủ nghiêm ngặt cấu trúc thư mục yêu cầu:
- `models/`: Định nghĩa dữ liệu Song, Playlist, PlaybackState.
- `services/`: Xử lý Logic âm thanh, quyền truy cập và lưu trữ.
- `providers/`: Quản lý trạng thái ứng dụng (State Management).
- `screens/`: Các màn hình chính (Home, Now Playing, Playlist, All Songs, Settings).
- `widgets/`: Các thành phần giao diện dùng chung.
- `utils/`: Các công cụ định dạng thời gian và hằng số màu sắc.

##  Cách thêm nhạc để kiểm tra (Testing)

**Trên máy ảo Android (Emulator):**
1. Mở **Android Studio** -> **Device File Explorer**.
2. Tìm đến đường dẫn: `sdcard/Music`.
3. Chuột phải vào thư mục `Music` -> **Upload...** và chọn các file nhạc của bạn.
4. Mở ứng dụng **Files** trên điện thoại, nhấn vào từng bài nhạc để Android kích hoạt nhận diện.
5. Mở ứng dụng **Offline Music Player** và tận hưởng!

##  Công nghệ sử dụng

- **just_audio**: Lõi xử lý phát nhạc mạnh mẽ.
- **audio_service**: Hỗ trợ chơi nhạc chạy nền và thông báo điều khiển.
- **on_audio_query**: Quét dữ liệu MediaStore từ Android.
- **provider**: Quản lý trạng thái ứng dụng hiệu quả.
- **permission_handler**: Quản lý quyền truy cập bộ nhớ.
- **shared_preferences**: Lưu trữ dữ liệu người dùng dưới máy.

## ⚠ Lưu ý và Cải tiến tương lai
- **Lưu ý:** Trên trình duyệt Web, do tính bảo mật, ứng dụng sẽ hiển thị nhạc mẫu (Sample Songs) thay vì quét ổ cứng máy tính.
- **Cải tiến:** Thêm tính năng Equalizer, hiển thị lời bài hát (Lyrics) và tìm kiếm thông minh hơn.

##  Music Attribution
Các bài hát mẫu trong dự án được sử dụng từ nguồn miễn phí:
- [Bensound](https://www.bensound.com)
- [Free Music Archive](https://freemusicarchive.org)

---
*Thực hiện bởi: [TRAN VAN VU]
