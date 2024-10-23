import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:juai_flutter/app/global_widgets/text_field.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.only(
          left: 24.w,
          right: 24.w,
          top: 24.h,
          bottom: 34.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Enter your phone number",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            32.verticalSpace,
            AlTextField(
              hintText: "Phone number",
              keyboardType: TextInputType.phone,
              controller: controller.phoneController,
            ),
            const Spacer(),
            Obx(
              () => ElevatedButton(
                onPressed: controller.inputSuccess.value
                    ? controller.checkPhone
                    : null,
                child: const Text("Continue"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
