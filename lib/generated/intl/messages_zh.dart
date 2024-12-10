// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'zh';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "add_prompt": MessageLookupByLibrary.simpleMessage("新增AI提示"),
        "alias_desc": MessageLookupByLibrary.simpleMessage("仅用于多个相同的服务商之间区分"),
        "alias_empty": MessageLookupByLibrary.simpleMessage("别名不能为空"),
        "alias_input": MessageLookupByLibrary.simpleMessage("请输入别名"),
        "alias_maxlength": MessageLookupByLibrary.simpleMessage("别名最大10个字符"),
        "alias_repeat": MessageLookupByLibrary.simpleMessage("别名不可以重复"),
        "alias_required": MessageLookupByLibrary.simpleMessage("别名(必填)"),
        "apikey_repeat": MessageLookupByLibrary.simpleMessage("ApiKey不可以重复"),
        "app_name": MessageLookupByLibrary.simpleMessage("聚AI"),
        "appearance": MessageLookupByLibrary.simpleMessage("外观"),
        "author": MessageLookupByLibrary.simpleMessage("作者"),
        "auto_title": MessageLookupByLibrary.simpleMessage("自动生成标题"),
        "btn_add": MessageLookupByLibrary.simpleMessage("添加"),
        "canPaint": MessageLookupByLibrary.simpleMessage("可作画"),
        "canTalk": MessageLookupByLibrary.simpleMessage("可对话"),
        "canVoice": MessageLookupByLibrary.simpleMessage("可语音"),
        "can_not_get_voice_content":
            MessageLookupByLibrary.simpleMessage("没有识别到语音内容"),
        "cancel": MessageLookupByLibrary.simpleMessage("取消"),
        "canceling": MessageLookupByLibrary.simpleMessage("正在取消..."),
        "cannot_empty": MessageLookupByLibrary.simpleMessage("不能为空"),
        "chat_content_need_add":
            MessageLookupByLibrary.simpleMessage("点击右上角添加各种绘画，数字人等"),
        "chat_setting": MessageLookupByLibrary.simpleMessage("聊天设置"),
        "clear_context": MessageLookupByLibrary.simpleMessage("清空上下文"),
        "collect": MessageLookupByLibrary.simpleMessage("收藏"),
        "confirm": MessageLookupByLibrary.simpleMessage("确定"),
        "confirm_pwd": MessageLookupByLibrary.simpleMessage("确认密码"),
        "conform_resend": MessageLookupByLibrary.simpleMessage("确定重新发送消息吗"),
        "copy": MessageLookupByLibrary.simpleMessage("复制"),
        "copy_success": MessageLookupByLibrary.simpleMessage("复制成功"),
        "custom": MessageLookupByLibrary.simpleMessage("自定义"),
        "default1": MessageLookupByLibrary.simpleMessage("默认"),
        "delete": MessageLookupByLibrary.simpleMessage("删除"),
        "delete_config_reminder":
            MessageLookupByLibrary.simpleMessage("确定删除当前配置吗"),
        "delete_reminder": MessageLookupByLibrary.simpleMessage("确定删除这条消息吗？"),
        "digitalMan": MessageLookupByLibrary.simpleMessage("数字人"),
        "download": MessageLookupByLibrary.simpleMessage("下载"),
        "download_fail": MessageLookupByLibrary.simpleMessage("下载失败"),
        "download_success": MessageLookupByLibrary.simpleMessage("下载成功"),
        "downloading": MessageLookupByLibrary.simpleMessage("下载中..."),
        "edit": MessageLookupByLibrary.simpleMessage("编辑"),
        "empty_content_need_add":
            MessageLookupByLibrary.simpleMessage("您还没有内容."),
        "enter_setting_init_server":
            MessageLookupByLibrary.simpleMessage("请先进入服务并配置服务商"),
        "error_": MessageLookupByLibrary.simpleMessage("错误"),
        "error_cancel": MessageLookupByLibrary.simpleMessage("取消请求"),
        "error_code": MessageLookupByLibrary.simpleMessage("错误码"),
        "error_detail": MessageLookupByLibrary.simpleMessage("错误详情"),
        "error_detail_desc":
            MessageLookupByLibrary.simpleMessage("如果问题仍然存在，请尝试重启应用"),
        "error_detail_network_desc":
            MessageLookupByLibrary.simpleMessage("请检查网络是否正常，或检查是否开启代理"),
        "error_format": MessageLookupByLibrary.simpleMessage("格式错误"),
        "error_msg": MessageLookupByLibrary.simpleMessage("错误信息"),
        "error_network": MessageLookupByLibrary.simpleMessage("网络错误"),
        "error_null": MessageLookupByLibrary.simpleMessage("空数据"),
        "error_parse": MessageLookupByLibrary.simpleMessage("解析错误"),
        "error_timeout": MessageLookupByLibrary.simpleMessage("请求超时"),
        "error_unknown": MessageLookupByLibrary.simpleMessage("未知错误"),
        "feedback": MessageLookupByLibrary.simpleMessage("反馈"),
        "feedback_question": MessageLookupByLibrary.simpleMessage("问题反馈"),
        "forget_password": MessageLookupByLibrary.simpleMessage("忘记密码"),
        "function": MessageLookupByLibrary.simpleMessage("功能"),
        "gemini_setting": MessageLookupByLibrary.simpleMessage("Gemini 服务商"),
        "gemini_setting_desc": MessageLookupByLibrary.simpleMessage(
            "设置 Gemini 的 API key 和 API Server"),
        "generate_content_is_empty":
            MessageLookupByLibrary.simpleMessage("生成内容为空"),
        "generate_image": MessageLookupByLibrary.simpleMessage("生成图片"),
        "generate_image_fail": MessageLookupByLibrary.simpleMessage("图片生成失败"),
        "getmodules_fail": MessageLookupByLibrary.simpleMessage(
            "获取模型失败,如果确定你的Key可以使用，请直接点击保存"),
        "has_exist": MessageLookupByLibrary.simpleMessage("已存在"),
        "has_reduce": MessageLookupByLibrary.simpleMessage("开启后会有部分损耗"),
        "have_account": MessageLookupByLibrary.simpleMessage("已经有账号"),
        "hint_addServerDesc": MessageLookupByLibrary.simpleMessage("请输入服务器地址"),
        "hold_micro_phone_talk":
            MessageLookupByLibrary.simpleMessage("按住底部麦克风，开始聊天吧"),
        "hold_talk": MessageLookupByLibrary.simpleMessage("按住说话"),
        "home_chat": MessageLookupByLibrary.simpleMessage("聊天"),
        "home_factory": MessageLookupByLibrary.simpleMessage("商店"),
        "home_model": MessageLookupByLibrary.simpleMessage("模型"),
        "home_my": MessageLookupByLibrary.simpleMessage("我的"),
        "home_server": MessageLookupByLibrary.simpleMessage("服务"),
        "home_setting": MessageLookupByLibrary.simpleMessage("设置"),
        "home_square": MessageLookupByLibrary.simpleMessage("广场"),
        "input_name": MessageLookupByLibrary.simpleMessage("请输入名称"),
        "input_text": MessageLookupByLibrary.simpleMessage("请输入内容"),
        "invitation_code": MessageLookupByLibrary.simpleMessage("邀请码"),
        "invitation_code_desc": MessageLookupByLibrary.simpleMessage(
            "邀请码用于邀请好友注册，注册后，好友注册成功后，您可以获得奖励。"),
        "invitation_code_input": MessageLookupByLibrary.simpleMessage("请输入邀请码"),
        "is_getting_modules": MessageLookupByLibrary.simpleMessage("正在获取模型..."),
        "is_responsing": MessageLookupByLibrary.simpleMessage("服务器正在回应..."),
        "language": MessageLookupByLibrary.simpleMessage("语言"),
        "leave_cancel": MessageLookupByLibrary.simpleMessage("松开 取消"),
        "leave_send": MessageLookupByLibrary.simpleMessage("松开 发送"),
        "library": MessageLookupByLibrary.simpleMessage("工坊"),
        "loading": MessageLookupByLibrary.simpleMessage("加载中..."),
        "login": MessageLookupByLibrary.simpleMessage("登录"),
        "login_success": MessageLookupByLibrary.simpleMessage("登录成功"),
        "main_language": MessageLookupByLibrary.simpleMessage("简体中文"),
        "model": MessageLookupByLibrary.simpleMessage("模型"),
        "models": MessageLookupByLibrary.simpleMessage("模型"),
        "more": MessageLookupByLibrary.simpleMessage("更多"),
        "name": MessageLookupByLibrary.simpleMessage("名称"),
        "natural": MessageLookupByLibrary.simpleMessage("现实的"),
        "new_chat": MessageLookupByLibrary.simpleMessage("随便聊聊"),
        "new_version": MessageLookupByLibrary.simpleMessage("发现新版本"),
        "no_account": MessageLookupByLibrary.simpleMessage("没有账号? "),
        "no_audio_file": MessageLookupByLibrary.simpleMessage("无法获取到语音文件"),
        "no_module_use": MessageLookupByLibrary.simpleMessage("没有模型可用的模型"),
        "no_more_data": MessageLookupByLibrary.simpleMessage("没啦，别试啦."),
        "not_support_tts":
            MessageLookupByLibrary.simpleMessage("您所添加的服务商不支持语音聊天"),
        "official": MessageLookupByLibrary.simpleMessage("官方"),
        "ollama_setting": MessageLookupByLibrary.simpleMessage("Ollama 服务商"),
        "ollama_setting_desc":
            MessageLookupByLibrary.simpleMessage("设置 Ollama 的 API Server"),
        "only_support_dalle3": MessageLookupByLibrary.simpleMessage(
            "目前生成图片仅支持 dall-e-3 模型,您所添加的服务商均不支持该模型"),
        "open_micro_permission":
            MessageLookupByLibrary.simpleMessage("请打开录音权限"),
        "openai_setting": MessageLookupByLibrary.simpleMessage("ChatGPT 服务商"),
        "openai_setting_desc": MessageLookupByLibrary.simpleMessage(
            "设置 ChatGPT 的 API key 和 API Server"),
        "org_notrequired": MessageLookupByLibrary.simpleMessage("组织(选填)"),
        "other_set": MessageLookupByLibrary.simpleMessage("其他设置"),
        "phone": MessageLookupByLibrary.simpleMessage("手机号"),
        "pin": MessageLookupByLibrary.simpleMessage("置顶"),
        "please_input": MessageLookupByLibrary.simpleMessage("请输入"),
        "primary_color": MessageLookupByLibrary.simpleMessage("主题色"),
        "prompt_demo": MessageLookupByLibrary.simpleMessage(
            "示例:请根据我提供的信息，帮助我制作简历或优化简历。其中制作和优化的内容一定要围绕提供的信息进行，内容需突出个人亮点和特点，并按照时间顺序列出过往的工作经验，通过数据化等方式量化工作中的突出事迹和成绩，且整体内容要求简洁易懂、格式清晰，不能有语法错误。"),
        "prompt_greeting": MessageLookupByLibrary.simpleMessage("问候语"),
        "prompt_greeting_demo": MessageLookupByLibrary.simpleMessage(
            "示例:为清晰有力地传达你的经验和技能，请为我提供以下信息： 1. 你想申请的职位/行业或未来目标； 2. 教育背景，如学校、学位、专业、获得荣誉等； 3. 你过去现在的工作/实习经历，如职位、职业和项目经验及业绩成果等； 4. 你的技能、特长、语言能力和专责资质等。"),
        "prompt_hint": MessageLookupByLibrary.simpleMessage("提示词描述"),
        "pwd": MessageLookupByLibrary.simpleMessage("密码"),
        "pwd_format_error": MessageLookupByLibrary.simpleMessage("密码格式错误"),
        "pwd_not_same": MessageLookupByLibrary.simpleMessage("两次密码不一致"),
        "record_time_too_short": MessageLookupByLibrary.simpleMessage("录音时间太短"),
        "recording": MessageLookupByLibrary.simpleMessage("正在录音..."),
        "register": MessageLookupByLibrary.simpleMessage("注册"),
        "register_success": MessageLookupByLibrary.simpleMessage("注册成功"),
        "reminder": MessageLookupByLibrary.simpleMessage("温馨提示"),
        "resend": MessageLookupByLibrary.simpleMessage("重新发送"),
        "retry": MessageLookupByLibrary.simpleMessage("重试"),
        "save": MessageLookupByLibrary.simpleMessage("保存"),
        "save_fail": MessageLookupByLibrary.simpleMessage("保存失败"),
        "save_gallary": MessageLookupByLibrary.simpleMessage("保存到相册"),
        "save_success": MessageLookupByLibrary.simpleMessage("保存成功"),
        "screenshot": MessageLookupByLibrary.simpleMessage("截图"),
        "select": MessageLookupByLibrary.simpleMessage("请选择"),
        "send": MessageLookupByLibrary.simpleMessage("发送"),
        "send_again": MessageLookupByLibrary.simpleMessage("再次发送"),
        "sending_server": MessageLookupByLibrary.simpleMessage("正在发送到服务器..."),
        "servers": MessageLookupByLibrary.simpleMessage("服务商"),
        "set_default_models":
            MessageLookupByLibrary.simpleMessage("未获取到任何模型，已经为它添加系统默认模型。"),
        "share": MessageLookupByLibrary.simpleMessage("分享"),
        "share_to": MessageLookupByLibrary.simpleMessage("分享到"),
        "size": MessageLookupByLibrary.simpleMessage("尺寸"),
        "style": MessageLookupByLibrary.simpleMessage("风格"),
        "sync": MessageLookupByLibrary.simpleMessage("同步"),
        "tempture": MessageLookupByLibrary.simpleMessage("温度参数"),
        "text_parse_model": MessageLookupByLibrary.simpleMessage("文本解析模型"),
        "theme": MessageLookupByLibrary.simpleMessage("主题"),
        "theme_auto": MessageLookupByLibrary.simpleMessage("跟随系统"),
        "theme_dark": MessageLookupByLibrary.simpleMessage("深色模式"),
        "theme_normal": MessageLookupByLibrary.simpleMessage("普通模式"),
        "theme_setting": MessageLookupByLibrary.simpleMessage("主题设置"),
        "third_party": MessageLookupByLibrary.simpleMessage("第三方"),
        "title": MessageLookupByLibrary.simpleMessage("标题"),
        "title_promot": MessageLookupByLibrary.simpleMessage(
            "使用四到五个字直接返回这句话的简要主题，不要解释、不要标点、不要语气词、不要多余文本，不要加粗，如果没有主题，请直接返回“闲聊”"),
        "translate": MessageLookupByLibrary.simpleMessage("翻译"),
        "true_": MessageLookupByLibrary.simpleMessage("正确"),
        "tts": MessageLookupByLibrary.simpleMessage("朗读"),
        "unpin": MessageLookupByLibrary.simpleMessage("取消置顶"),
        "update_now": MessageLookupByLibrary.simpleMessage("去更新"),
        "validate": MessageLookupByLibrary.simpleMessage("验证"),
        "validate_fail": MessageLookupByLibrary.simpleMessage("验证失败"),
        "validate_success": MessageLookupByLibrary.simpleMessage("验证成功"),
        "vcode": MessageLookupByLibrary.simpleMessage("验证码"),
        "version": MessageLookupByLibrary.simpleMessage("版本"),
        "vivid": MessageLookupByLibrary.simpleMessage("超现实"),
        "voiceChat": MessageLookupByLibrary.simpleMessage("语音聊天"),
        "yes_know": MessageLookupByLibrary.simpleMessage("知道了"),
        "yesterday": MessageLookupByLibrary.simpleMessage("昨天")
      };
}
