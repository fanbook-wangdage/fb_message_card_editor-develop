import 'package:get/get.dart';

import 'translation/translation_en.dart';
import 'translation/translation_zh.dart';

class MessageKeys extends Translations {
  static const String zh = 'zh';
  static const String en = 'en';

  @override
  Map<String, Map<String, String>> get keys {
    return {
      MessageKeys.zh: TranslationZh.translationZh,
      MessageKeys.en: TranslationEn.translationEn,
    };
  }
}
