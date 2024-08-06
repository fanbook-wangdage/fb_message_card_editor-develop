import 'package:fb_message_card_editor/app/modules/login/LandscapeLoginWrap.dart';
import 'package:fb_message_card_editor/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:just_throttle_it/just_throttle_it.dart';

import 'captcha_logic.dart';

class CaptchaPage extends GetView<CaptchaLogic> {
  CaptchaPage();

  @override
  Widget build(BuildContext context) {
    final isLandscape = true;
    final child = GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: isLandscape ? 32 : 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 24),
              height: 24,
              width: 100,
              child: TextButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.resolveWith(
                      (states) => EdgeInsets.zero),
                ),
                onPressed: Get.back,
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back,
                      size: 14,
                      color: appThemeData.textTheme.bodyLarge?.color,
                    ),
                    Text('返回'.tr,
                        style: appThemeData.textTheme.bodyLarge
                            ?.copyWith(fontSize: 14))
                  ],
                ),
              ),
            ),
            SizedBox(height: isLandscape ? 18 : 48),
            Text('随便输入验证码'.tr,
                style: appThemeData.textTheme.bodyLarge?.copyWith(
                  fontSize: 24,
                  height: 1.16,
                  fontWeight: FontWeight.w600,
                )),
            SizedBox(
              height: isLandscape ? 8 : 12,
            ),
            Text('验证码已发送至 +%s %s'.trArgs(["86", controller.mobile.toString()]),
                style: appThemeData.textTheme.bodyLarge
                    ?.copyWith(height: 1.21, fontSize: isLandscape ? 12 : 14)),
            const SizedBox(
              height: 32,
            ),
            Container(
              height: 48,
              decoration: BoxDecoration(
                // color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(isLandscape ? 4 : 6),
                border: Border.all(
                    color: appThemeData.dividerColor.withOpacity(0.2)),
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      controller: controller.captchaController,
                      focusNode: controller.node,
                      // style: Theme.of(context).textTheme.bodyLarge,
                      inputFormatters: <TextInputFormatter>[
                        LengthLimitingTextInputFormatter(6) //限制长度
                      ],
                      style: appThemeData.textTheme.bodyLarge
                          ?.copyWith(fontSize: 14),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 9,
                        ), // 实现输入框文本居中，mac、windows需要设置不同的偏移量
                        border: InputBorder.none,
                        hintText: '输入验证码'.tr,
                        hintStyle: TextStyle(
                          color: appThemeData.disabledColor.withOpacity(0.4),
                          fontSize: 14,
                        ),
                      ),
                      onChanged: controller.onChanged,
                      autofocus: true,
                    ),
                  ),
                  GetBuilder<CaptchaLogic>(
                      id: controller.updateCountWidget,
                      builder: (controller) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: controller.enableReSend
                              ? GestureDetector(
                                  onTap: () {
                                    Throttle.seconds(1, () {
                                      controller.getCaptcha();
                                    });
                                  },
                                  child: Text(
                                    '重新发送'.tr,
                                    style: appThemeData.textTheme.bodyLarge
                                        ?.copyWith(
                                            color: appThemeData.primaryColor,
                                            fontSize: 14),
                                  ),
                                )
                              : Text('${controller.count} s',
                                  style: appThemeData.textTheme.bodyLarge
                                      ?.copyWith(
                                          fontSize: 14,
                                          color: appThemeData.primaryColor)),
                        );
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    return OrientationBuilder(
      builder: (context, _) {
        return LandscapeLoginWrap(child: child);
      },
    );
  }
}
