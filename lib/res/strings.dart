

class AppStrings{
  AppStrings._();

  static const String baseURL = "https://landapi.vipage.vn/vvlanding";
  static const List<String> listStatus  = ["Tất cả","Đơn mới","Đã xác nhận","Chờ lấy hàng","Đang giao", "Đã giao", "Chờ chuyển hoàn", "Đã chuyển hoàn","Đã đối soát","Delay","Đã hủy"];

  ///// permission
  static const String per_camera = "Máy ảnh";
  static const String per_storage = "Bộ nhớ";
  static const String per_microphone = "Ghi âm";
  static const String per_accessMediaLocation = "Vị trí";
  static const String per_ask_permission_head = "Bạn cần vào Cài đặt trên thiết bị và cho phép quyền";
  static const String per_ask_permission_tail = "để sử dụng dịch vụ này!";
  ///////
  static const String message_null_data = "Chưa có dữ liệu hiển thị!";
  /////
  static const String message_err_api = "Gặp sự cố đường truyền internet!";

  //// Login

  static const String account = "Tài khoản";
  static const String password = "Mật khẩu";
  static const String login = "Đăng nhập";
  static const String message_login_success = "Đăng nhập thành công";
  static const String message_login_err_account_empty = "Bạn chưa nhập tài khoản";
  static const String message_login_err_password_empty = "Bạn chưa nhập nhạp mật khẩu";

  static const String register = "Đăng ký";


}
