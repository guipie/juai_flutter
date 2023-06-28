// baidu yapi
// const SERVER_API_URL = 'https://yapi.baidu.com/mock/41008';
// const SERVER_API_URL = 'https://yapi.ducafecat.tech/mock/11';
// ignore_for_file: constant_identifier_names

import 'package:juai/common/config.dev.dart';
import 'package:juai/common/config.prod.dart';
import 'package:flutter/foundation.dart';

const SERVER_API_URL = kReleaseMode ? JuAIConfigProd.SERVER_API_URL : JuAIConfigDev.SERVER_API_URL;
const SERVER_SIGNALR_URL = kReleaseMode ? JuAIConfigProd.SERVER_SIGNALR_URL : JuAIConfigDev.SERVER_SIGNALR_URL;
const QINIU_DOMAIN = kReleaseMode ? JuAIConfigProd.QINIU_DOMAIN : JuAIConfigDev.QINIU_DOMAIN;

const SERVER_CHAT_API_KEY = 'juai-juai-juai';
const SERVER_CHAT_PROXY_API_URL = 'http://3.96.174.56:3003'; //'http://54.169.209.162/juaichat/';

