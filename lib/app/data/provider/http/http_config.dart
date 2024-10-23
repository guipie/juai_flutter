class HttpConfig {
  static const String BASE_URL = "";
  static const String GET = "GET";
  static const String POST = "POST";
  static const String PUT = "PUT";
  static const String PATCH = "PATCH";
  static const String DELETE = "DELETE";

  static const CUSTOM_ERROR_CODE = 'DIO_CUSTOM_ERROR'; // 自定义错误代码
  static const REQUEST_TYPE_STR = 'REQUEST'; // 请求类型字符串
  static const RESPONSE_TYPE_STR = 'RESPONSE'; // 响应类型字符串
  static const ERROR_TYPE_STR = 'RESPONSE_ERROR'; // 错误类型字符串
  static const DEFAULT_LOAD_MSG = '请求中...'; // 默认请求提示文字

  static const CONNECT_TIMEOUT = 60000; // 连接超时时间
  static const RECEIVE_TIMEOUT = 60000; // 接收超时时间
  static const SEND_TIMEOUT = 60000; // 发送超时时间

  static const DIALOG_TYPE_OTHERS = 'OTHERS'; // 结果处理-其他类型
  static const DIALOG_TYPE_TOAST = 'TOAST'; // 结果处理-轻提示类型
  static const DIALOG_TYPE_ALERT = 'ALERT'; // 结果处理-弹窗类型
  static const DIALOG_TYPE_CUSTOM = 'CUSTOM'; // 结果处理-自定义处理

  static String loadMsg = DEFAULT_LOAD_MSG; // 请求提示文字

  static String errorShowTitle = '发生错误啦'; // 错误提示标题

  static String errorShowMsg = ''; // 错误提示文字
}
