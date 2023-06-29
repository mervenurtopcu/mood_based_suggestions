import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mood_based_suggestions/product/constants/index.dart';
import 'package:mood_based_suggestions/product/widget/button/authentication_button.dart';
import 'package:mood_based_suggestions/product/widget/text/authentication_subtitle.dart';
import 'package:mood_based_suggestions/product/widget/text/authentication_title.dart';
import 'package:mood_based_suggestions/product/widget/text_field/authentication_text_field.dart';
import '../../../product/enums/lottie_enums.dart';
import '../../../product/theme/theme_provider.dart';
import '../register/register_screen.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ref.watch(settingsProvider).isDarkTheme
          ? ColorConstants.loginBackground
          : ColorConstants.loginLightBackground,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Center(
                      child: Lottie.asset(
                    LottieItems.login.lottiePath,
                    width: 200,
                    height: 200,
                    fit: BoxFit.fill,
                  )),
                )), //Lottie
            Expanded(
              flex: 1,
              child: Center(
                child: AuthTitle(
                    text: StringConstants.loginScreenTitle,
                    isDarkTheme: ref.watch(settingsProvider).isDarkTheme),
              ),
            ), //Title
            const Expanded(
              flex: 1,
              child: Center(
                child: AuthSubtitle(text: StringConstants.loginScreenSubtitle),
              ),
            ), //Subtitle
            const SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: AuthTextField(
                    icon: const Icon(Icons.person_outline_outlined),
                    labelText: StringConstants.loginScreenEmail,
                    isDarkTheme: ref.watch(settingsProvider).isDarkTheme,
                    obscureText: false),
              ),
            ), //Email
            const SizedBox(
              height: 15,
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: AuthTextField(
                  icon: const Icon(Icons.lock_open_outlined),
                  labelText: StringConstants.loginScreenPassword,
                  isDarkTheme: ref.watch(settingsProvider).isDarkTheme,
                  obscureText: true,
                ),
              ),
            ), //Password
            const SizedBox(
              height: 15,
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: AuthButton(
                  onPressed: () {},
                  isDarkTheme: ref.watch(settingsProvider).isDarkTheme,
                  text: StringConstants.loginScreenLoginButton,
                ),
              ),
            ), //
            Expanded(
                flex: 1,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    StringConstants.loginScreenForgetPassword,
                    style: TextStyle(
                        color: ref.watch(settingsProvider).isDarkTheme
                            ? ColorConstants.loginTextFieldFocus
                            : ColorConstants.loginLightButton,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                )), //ForgetPassword
            Expanded(
              flex: 1,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      StringConstants.loginScreenSignUpText,
                      style: TextStyle(
                          color: ref.watch(settingsProvider).isDarkTheme
                              ? ColorConstants.loginSubtitle
                              : ColorConstants.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w300),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const RegisterScreen()));
                      },
                      child: Text(
                        StringConstants.loginScreenSignUpTextButton,
                        style: TextStyle(
                            color: ref.watch(settingsProvider).isDarkTheme
                                ? ColorConstants.loginTextFieldFocus
                                : ColorConstants.loginLightButton,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
            ), //SignUpTextButton
          ],
        ),
      ),
    );
  }
}
