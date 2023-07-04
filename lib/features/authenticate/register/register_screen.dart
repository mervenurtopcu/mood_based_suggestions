import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mood_based_suggestions/product/constants/index.dart';
import 'package:mood_based_suggestions/product/theme/index.dart';
import 'package:mood_based_suggestions/product/widget/text/authentication_subtitle.dart';
import 'package:mood_based_suggestions/product/widget/text/authentication_title.dart';
import 'package:mood_based_suggestions/product/widget/text_form_field/authentication_text_form_field.dart';
import '../../../main.dart';
import '../../../product/global/utils.dart';
import '../../../product/widget/button/authentication_button.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  final Function() onClickedSignIn;
  const RegisterScreen({super.key, required this.onClickedSignIn});

  @override
  ConsumerState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ref.watch(settingsProvider).isDarkTheme
          ? ColorConstants.loginBackground
          : ColorConstants.loginLightBackground,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(flex: 2),
              Expanded(
                flex: 1,
                child: Center(
                  child: AuthTitle(
                    text: StringConstants.registerScreenTitle,
                    isDarkTheme: ref.watch(settingsProvider).isDarkTheme,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.011,
              ),
              const Expanded(
                flex: 1,
                child: Center(
                  child: AuthSubtitle(
                    text: StringConstants.registerScreenSubtitle,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: AuthTextFormField(
                      icon: const Icon(Icons.email_outlined),
                      labelText: StringConstants.registerScreenEmail,
                      isDarkTheme: ref.watch(settingsProvider).isDarkTheme,
                      obscureText: false,
                      controller: emailController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (email) =>
                          email != null && !EmailValidator.validate(email)
                              ? StringConstants.registerScreenValidatorEmail
                              : null),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: AuthTextFormField(
                      icon: const Icon(Icons.lock_open_outlined),
                      labelText: StringConstants.registerScreenPassword,
                      isDarkTheme: ref.watch(settingsProvider).isDarkTheme,
                      obscureText: true,
                      controller: passwordController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => value != null && value.length < 6
                          ? StringConstants.registerScreenValidatorPassword
                          : null),
                ),
              ), //Password
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: AuthButton(
                    text: StringConstants.registerScreenSignUpButton,
                    isDarkTheme: ref.watch(settingsProvider).isDarkTheme,
                    onPressed: signUp,
                  ),
                ),
              ),
              const Spacer(flex: 1),
              Expanded(
                flex: 1,
                child: RichText(
                    text: TextSpan(
                        style: const TextStyle(
                            color: ColorConstants.loginSubtitle,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                        text: StringConstants.registerScreenLoginText,
                        children: [
                      TextSpan(
                        text: 'Log In',
                        style: TextStyle(
                            color: ref.watch(settingsProvider).isDarkTheme
                                ? ColorConstants.loginTextFieldFocus
                                : ColorConstants.loginLightButton,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                        recognizer: TapGestureRecognizer()
                          ..onTap = widget.onClickedSignIn,
                      )
                    ])),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future signUp() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ));
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      Utils.showSnackBar(e.message);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
