import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../firebase/user_credential/login_signup.dart';
import '../../res/assets/images.dart';
import '../../res/colors/colors.dart';
import '../../res/components/widgets/formfield/input_email_widget.dart';

import '../../res/components/widgets/formfield/input_password_widget.dart';
import '../../res/components/widgets/button/round_button_widget.dart';
import '../../res/components/widgets/text/text_widget.dart';
import '../../res/routes/routes_name.dart';
import '../../view_model/controller/signin/signin_view_model.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    final signInVM = Get.put(SignInViewModel());
    final controller = Get.put(UserController());
    GlobalKey<FormState> signinformkey = GlobalKey<FormState>();
    return SafeArea(
        child: Scaffold(
      body: Form(
        key: signinformkey,
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: Get.height * 0.22,
                  width: Get.width,
                  child: Image.asset(
                    ImageAssets.tintImage,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 100,
                  child: Center(
                    child: RichText(
                        text: const TextSpan(
                      text: ' Welcome Back !\n',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColor.whiteColor,
                        fontSize: 28,
                      ),
                      children: [
                        TextSpan(
                          text: '      Sign In to Voice News App',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColor.whiteColor,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    )),
                  ),
                )
              ],
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ListView(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    customText(" Email", true),
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                    InputEmailTextField(
                      controller: signInVM.emailController.value,
                      icons: const Icon(Icons.email),
                      validator: signInVM.validateEmail,
                    ),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    customText(" Password", true),
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                    InputPasswordTextField(
                      controllerpass: signInVM.passwordController.value,
                      icons: const Icon(Icons.key),
                      isPasswordType: true,
                    ),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: customText(" Forgot Password ? ", true)),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    RoundButton(
                      width: Get.width,
                      height: Get.height * 0.06,
                      onPress: () {
                        if (signinformkey.currentState!.validate()) {
                          controller.signInUser(
                              signInVM.emailController.value.text,
                              signInVM.passwordController.value.text);
                          Get.toNamed(RouteName.homeView);
                        }
                      },
                      title: 'SIGN IN',
                    ),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    Center(
                      child: Container(
                        height: Get.height * 0.05,
                        width: Get.width * 0.7,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1.3, color: AppColor.redColor),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            const Text(
                              "  Don't have an account ?",
                              style: TextStyle(
                                  color: AppColor.blackColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                            GestureDetector(
                                onTap: () {
                                  Get.toNamed(RouteName.signUpView);
                                },
                                child: const Text(
                                  " Create Account",
                                  style: TextStyle(
                                      color: AppColor.redColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                )),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
