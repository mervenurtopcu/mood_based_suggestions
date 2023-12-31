import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mood_based_suggestions/product/constants/index.dart';
import 'package:mood_based_suggestions/product/services/firebase_auth_service.dart';
import 'package:mood_based_suggestions/product/widget/button/authentication_button.dart';
import 'package:mood_based_suggestions/product/widget/text/authentication_subtitle.dart';
import 'package:mood_based_suggestions/product/widget/text/authentication_title.dart';
import 'package:mood_based_suggestions/product/widget/text_field/authentication_text_field.dart';
import '../../../main.dart';
import '../../../product/enums/lottie_enums.dart';
import '../../../product/global/utils.dart';
import '../../../product/theme/theme_provider.dart';
import '../forgot_password/forgot_password_screen.dart';
import '../verify_email/verify_email_screen.dart';
import 'auth_page.dart';

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
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: CircularProgressIndicator(
                  color: ref.watch(settingsProvider).isDarkTheme
                      ? ColorConstants.white
                      : ColorConstants.black,
                ));
              } else if (snapshot.hasError) {
                return const Center(
                    child: Text(StringConstants.errorLoginScreen));
              } else if (snapshot.hasData) {
                return const VerifyEmailScreen();
              } else {
                return const AuthPage();
              }
            }));
  }
}

class LoginWidget extends ConsumerStatefulWidget {
  final VoidCallback onClickedSignUp;
  const LoginWidget({super.key, required this.onClickedSignUp});

  @override
  ConsumerState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends ConsumerState<LoginWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final FirebaseAuthService firebaseService = FirebaseAuthService.instance!;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 0.6,
                fit: BoxFit.fill,
              )),
            ),
          ), //Lottie
          Expanded(
            flex: 1,
            child: Center(
              child: AuthTitle(
                  text: StringConstants.loginScreenTitle,
                  isDarkTheme: ref.watch(settingsProvider).isDarkTheme),
            ),
          ), //Title
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          const Expanded(
            flex: 1,
            child: Center(
              child: AuthSubtitle(text: StringConstants.loginScreenSubtitle),
            ),
          ), //Subtitle
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: AuthTextField(
                  controller: emailController,
                  icon: const Icon(Icons.person_outline_outlined),
                  labelText: StringConstants.loginScreenEmail,
                  isDarkTheme: ref.watch(settingsProvider).isDarkTheme,
                  obscureText: false),
            ),
          ), //Email
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: AuthTextField(
                controller: passwordController,
                icon: const Icon(Icons.lock_open_outlined),
                labelText: StringConstants.loginScreenPassword,
                isDarkTheme: ref.watch(settingsProvider).isDarkTheme,
                obscureText: true,
              ),
            ),
          ), //Password
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ForgotPasswordScreen()));
                },
                child: const Text(
                  StringConstants.loginScreenForgetPassword,
                  style: TextStyle(
                      color: ColorConstants.loginSubtitle,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: AuthButton(
                onPressed: _signIn,
                isDarkTheme: ref.watch(settingsProvider).isDarkTheme,
                text: StringConstants.loginScreenLoginButton,
              ),
            ),
          ), //
          const Spacer(flex: 1),
          Expanded(
            flex: 1,
            child: RichText(
                text: TextSpan(
                    style: const TextStyle(
                        color: ColorConstants.loginSubtitle,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                    text: StringConstants.loginScreenSignUpText,
                    children: [
                  TextSpan(
                    text: 'Sign Up',
                    style: TextStyle(
                        color: ref.watch(settingsProvider).isDarkTheme
                            ? ColorConstants.loginTextFieldFocus
                            : ColorConstants.loginLightButton,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                    recognizer: TapGestureRecognizer()
                      ..onTap = widget.onClickedSignUp,
                  )
                ])),
          ), //ForgetPassword
        ],
      ),
    );
  }

  Future _signIn() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ));
    firebaseService.signIn(email: emailController.text.trim(), password: passwordController.text.trim());
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
