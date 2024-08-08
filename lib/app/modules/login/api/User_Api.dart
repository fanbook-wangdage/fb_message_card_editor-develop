import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fb_message_card_editor/http/Global.dart';
import 'package:fb_message_card_editor/http/http_utils.dart';

import 'fb_encryption.dart';
import 'package:lib_net/lib_net.dart' as net;

class UserApi {
  static String updateTokenUrl = '/api/common/ctk';

  static Future sendCaptcha(String mobile, String device, String? areaCode,
      {String? codeType}) {
    return Http.request("${net.HttpConfig.host}/api/common/verification", data: {
      "mobile": fbEncrypt(mobile),
      "device": device,
      "area_code": areaCode,
      "code_type": codeType, // 用于区分不同类型的短信验证
      "encrypt_type": "FBE",
    });
  }

  static Future login(
      String mobile, String code, String device, String areaCode,
      {String thirdParty = ""}) async {
    // 登录后的接口需要用到deviceInfo的信息，所以这里获取一下，方法内部已经做了平台兼容处理
    await Global.getAndroidDeviceInfo();
    return Http.request("${net.HttpConfig.host}/api/user/login", showDefaultErrorToast: true, data: {
      "type": "mobile",
      "third_party": thirdParty,
      "mobile": fbEncrypt(mobile.toString()),
      "code": fbEncrypt(code),
      "device": device,
      "area_code": areaCode,
      "encrypt_type": "FBE",
    });
  }

  static Future getChatId() {
    return Http.request(
        'https://a1-newtest.fanbook.mobi/api/bot/d38d0bf1f449f8f08181b5b678a8123fdbbcc86d4b901c10377b3d57946f2184b9dec5005c6398b1aa6c4024ec29052e/getPrivateChat',
        showDefaultErrorToast: true,
        options: Options(contentType: Headers.formUrlEncodedContentType),
        data: {
          "user_id": int.parse(Global.user.id),
        });
  }

  static Future sendPreView(String chat_id, Map json) {
    return Http.request(
        'https://124.221.67.43/webapi/bot/sendmessage',//windows版用http，web用https
        showDefaultErrorToast: true,
        isBody: true,
        options: Options(contentType: Headers.jsonContentType),
        data: {
          "chat_id": chat_id.toString(),
          "type": "task",
          "text": jsonEncode({'type': 'task', 'content': json}),
          "parse_mode": "Fanbook",
        });
  }
}
