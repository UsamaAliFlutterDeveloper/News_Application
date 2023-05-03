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
import '../../view_model/controller/signup/signup_view_model.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final signUpVM = Get.put(SignUpViewModel());
    final controller = Get.put(UserController());
    return SafeArea(
        child: Scaffold(
      body: Column(
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
                    text: ' Create Account\n',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColor.whiteColor,
                      fontSize: 28,
                    ),
                    children: [
                      TextSpan(
                        text: '      SignUp to Voice News App',
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
                  customText(" Full Name ", true),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  InputEmailTextField(
                    controller: signUpVM.nameController.value,
                    icons: const Icon(Icons.person),
                    validator: signUpVM.validateName,
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  customText(" Email ", true),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  InputEmailTextField(
                    controller: signUpVM.emailController.value,
                    icons: const Icon(Icons.email),
                    validator: signUpVM.validateEmail,
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  customText(" Password", true),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  InputPasswordTextField(
                    controllerpass: signUpVM.passwordController.value,
                    icons: const Icon(Icons.key),
                    isPasswordType: true,
                    validator: signUpVM.validatePassword,
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  customText(" Confirm Password", true),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  InputPasswordTextField(
                    controllerpass: signUpVM.retypePasswordController.value,
                    icons: const Icon(Icons.key),
                    isPasswordType: true,
                    validator: signUpVM.validatePassword,
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  RoundButton(
                    width: Get.width,
                    height: Get.height * 0.06,
                    onPress: () {
                      if (signUpVM.signupformkey.currentState != null &&
                          signUpVM.signupformkey.currentState!.validate()) {
                        controller.registerUser(
                          signUpVM.nameController.value.text,
                          signUpVM.emailController.value.text,
                          signUpVM.passwordController.value.text,
                          signUpVM.retypePasswordController.value.text,
                        );
                        Get.toNamed(RouteName.signInView);
                      }
                    },
                    title: 'SIGN UP',
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  Center(
                    child: Container(
                      height: Get.height * 0.05,
                      width: Get.width * 0.68,
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 1.3, color: AppColor.redColor),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          const Text(
                            "       Already have an account ? ",
                            style: TextStyle(
                                color: AppColor.blackColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: const Text(
                                " SignIn",
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
    ));
  }
}
